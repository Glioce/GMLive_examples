// A* FOR PLATFORMER V0.2
// Modified version of previous A* implementation.
// Nodes are created over platforms only.
// Following pseudo-code from Wikipedia.
// The best g score is the time needed to move the character to the next node.
// Important: In GMLive, ds_priority_find_priority returns 0 if
// the value is not found, so the g score of start is 1 intead of 0.

// Create
room_speed = 30; //slow animation
background_color = c_black;
cols = 15; //columns
rows = 13; //rows
w = 40; //cell width
h = 40; //cell height
w2 = w/2;
h2 = h/2;
// platofrms and nodes are inserted in the same grid
grid = ds_grid_create(cols, rows); //nodes grid
//obs = ds_grid_create(cols, rows); //obstacles grid

// Init grid
empty = -2; // value asigned to empty cells
block = -1; // value asigned to block/plaform cells
for (i = 0; i < cols; i++)
for (j = 0; j < rows-1; j++) {
    if (random(100) < 25) //is block/platform (true or false)
        ds_grid_set(grid, i, j, block);
    else //is empty
        ds_grid_set(grid, i, j, empty);
}
for (i = 0; i < cols; i++) {// last row filled with blocks
    ds_grid_set(grid, i, rows-1, block);
}

// Goal node
i = cols - 1;
j = 0;
goal = ds_map_create();
goal[?"x"] = i; //horizontal pos
goal[?"y"] = j; //vertical pos
goal[?"g"] = -1; //g score not calculated
goal[?"f"] = -1; //f score not calculated
goal[?"from"] = -1; //came from
ds_grid_set(grid, i, j, goal); //insert in grid

// Start node
i = 0;
j = rows - 2;
start = ds_map_create();
start[?"x"] = i; //horizontal pos
start[?"y"] = j; //vertical pos
start[?"g"] = 1; //initial cost
start[?"f"] = 1 + point_distance(i, j, goal[?"x"], goal[?"y"]); //f score
start[?"from"] = -1; //came from
ds_grid_set(grid, i, j, start); //insert in grid

// Nodes over platforms
for (i = 0; i < cols; i++)
for (j = 1; j < rows; j++) {
    if (ds_grid_get(grid, i, j) == block) {//create nodes
        for (k = -1; k <= 1; k++) {
            x = i + k;
            y = j - 1;
            // if position is valid (within grid and empty)
            if (x >=0 and x < cols and y >= 0 and y < rows
            and ds_grid_get(grid, i, y) <> block
            and ds_grid_get(grid, x, y) == empty) {
                node = ds_map_create();
                node[?"x"] = x; //horizontal pos
                node[?"y"] = y; //vertical pos
                node[?"f"] = -1; //f score not calculated
                node[?"g"] = -1; //g score not calculated
                node[?"from"] = -1; //came from
                ds_grid_set(grid, x, y, node); //insert in grid
            }
        }
    }
}

// Find neighbors
for (i = 0; i < cols; i++)
for (j = 0; j < rows; j++) {
    node = ds_grid_get(grid, i, j);
    if (node >= 0) {
        for (x = i + 1; x < cols; x+=1) {//right
            node[?"nr"] = ds_grid_get(grid, x, j);
            if (node[?"nr"] <> empty) break;
        }
        for (x = i - 1; x >= 0; x-=1) {//left
            node[?"nl"] = ds_grid_get(grid, x, j);
            if (node[?"nl"] <> empty) break;
        }
        for (y = j + 1; y < rows; y+=1) {//down
            node[?"nd"] = ds_grid_get(grid, i, y);
            if (node[?"nd"] <> empty) break;
        }
        for (y = j - 1; y >= 0; y-=1) {//up
            node[?"nu"] = ds_grid_get(grid, i, y);
            if (node[?"nu"] <> empty) break;
        }
    }
}

// Crate open set
openSet = ds_priority_create(); //discovered nodes
// Initially, only start is known
ds_priority_add(openSet, start, start[?"f"]);

done = false; //algorithm can keep going


#define draw
// A* algorithm
if (done == false ) begin //===================================================
if not ds_priority_empty(openSet) {// keep going
    // the node in openSet having the lowest f score
    current = ds_priority_delete_min(openSet);
    
    if (current == goal) {
        show_debug_message("DONE");
        done = true;
    }
    else {
        // for each neighbor of current
        // right ---------------------------------------------------
        neighbor = current[?"nr"];
        if (neighbor >= 0) {
            //tentative g score (current g + distance)
            gTemp = current[?"g"] + neighbor[?"x"] - current[?"x"];
            
            // if this path to neighbor is better than any previous one
            if (gTemp < neighbor[?"g"] or neighbor[?"g"] == -1) {
                neighbor[?"from"] = current;
                neighbor[?"g"] = gTemp;
                neighbor[?"f"] = gTemp + point_distance(
                    neighbor[?"x"], neighbor[?"y"], goal[?"x"], goal[?"y"]);
                    
                if (ds_priority_find_priority(openSet, neighbor) <= 0) 
                    ds_priority_add(openSet, neighbor, neighbor[?"f"]);
            }
        }
        // left --------------------------------------------------
        neighbor = current[?"nl"];
        if (neighbor >= 0) {
            //tentative g score (current g + distance)
            gTemp = current[?"g"] + current[?"x"] - neighbor[?"x"];
            
            // if this path to neighbor is better than any previous one
            if (gTemp < neighbor[?"g"] or neighbor[?"g"] == -1) {
                neighbor[?"from"] = current;
                neighbor[?"g"] = gTemp;
                neighbor[?"f"] = gTemp + point_distance(
                    neighbor[?"x"], neighbor[?"y"], goal[?"x"], goal[?"y"]);
                    
                if (ds_priority_find_priority(openSet, neighbor) <= 0) 
                    ds_priority_add(openSet, neighbor, neighbor[?"f"]);
            }
        }
        // down --------------------------------------------------
        neighbor = current[?"nd"];
        if (neighbor >= 0) {
            d = neighbor[?"y"] - current[?"y"]; //distance
            gTemp = current[?"g"] + sqrt(d); //tentative g score
            if (d > 5) gTemp += 3; //falling damage
            
            // if this path to neighbor is better than any previous one
            if (gTemp < neighbor[?"g"] or neighbor[?"g"] == -1) {
                neighbor[?"from"] = current;
                neighbor[?"g"] = gTemp;
                neighbor[?"f"] = gTemp + point_distance(
                    neighbor[?"x"], neighbor[?"y"], goal[?"x"], goal[?"y"]);
                    
                if (ds_priority_find_priority(openSet, neighbor) <= 0) 
                    ds_priority_add(openSet, neighbor, neighbor[?"f"]);
            }
        }
        // up --------------------------------------------------
        neighbor = current[?"nu"];
        if (neighbor >= 0) {
            d = current[?"y"] - neighbor[?"y"]; //distance
            f = ds_grid_get( // floor/ground
                grid, current[?"x"], current[?"y"] + 1) == block;
            from = current[?"from"];
            c = ds_grid_get( // ceil
                grid, from[?"x"], from[?"y"] - 1) == block;
            if (d <= 3 and (f == true or c == false)) {//max jumping height
                gTemp = current[?"g"] + (2 * sqrt(d)); //tentative g score
                
                // if this path to neighbor is better than any previous one
                if (gTemp < neighbor[?"g"] or neighbor[?"g"] == -1) {
                    neighbor[?"from"] = current;
                    neighbor[?"g"] = gTemp;
                    neighbor[?"f"] = gTemp + point_distance(
                        neighbor[?"x"], neighbor[?"y"], goal[?"x"], goal[?"y"]);
                        
                    if (ds_priority_find_priority(openSet, neighbor) <= 0) 
                        ds_priority_add(openSet, neighbor, neighbor[?"f"]);
                }
            }
        }//up
    }
} else {// openSet is empty, no solution
    show_debug_message("NO SOLUTION")
    done = true;
}
end //A* algorithm ============================================================

// Draw grid
// rectangles
//draw_set_color(c_white);
for (i = 0; i < cols; i++)
for (j = 0; j < rows; j++) {
    x = i * w;
    y = j * h;
    z = ds_grid_get(grid, i, j);
    if (z == block) draw_set_color(c_dkgray);
    else draw_set_color(c_gray);
    draw_rectangle(x, y, x+w-2, y+h-2, false);
}
// g and f values
draw_set_color(c_black);
for (i = 0; i < cols; i++)
for (j = 0; j < rows; j++) {
    x = i * w;
    y = j * h;
    z = ds_grid_get(grid, i, j);
    if (z >= 0) {
        draw_text(x, y, string_format(z[?"g"], 0, 1));
        draw_text(x, y+16, string_format(z[?"f"], 0, 1));
    }
}
// conections to neighbors
/*draw_set_color(c_lime);
for (i = 0; i < cols; i++)
for (j = 0; j < rows; j++) {
    x = i * w + w2;
    y = j * h + h2;
    z = ds_grid_get(grid, i, j);
    if (z >= 0) {
        n = z[?"nr"]; //neighbor
        if (n >= 0) draw_line(x, y, n[?"x"]*w+w2, n[?"y"]*h+h2);
        n = z[?"nu"]; //neighbor
        if (n >= 0) draw_line(x, y, n[?"x"]*w+w2, n[?"y"]*h+h2);
        n = z[?"nl"]; //neighbor
        if (n >= 0) draw_line(x, y, n[?"x"]*w+w2, n[?"y"]*h+h2);
        n = z[?"nd"]; //neighbor
        if (n >= 0) draw_line(x, y, n[?"x"]*w+w2, n[?"y"]*h+h2);
    }
}*/
// path
draw_set_color(c_red);
for (i = 0; i < cols; i++)
for (j = 0; j < rows; j++) {
    x = i * w + w2;
    y = j * h + h2;
    z = ds_grid_get(grid, i, j);
    if (z >= 0) {
        from = z[?"from"];
        if (from <> -1) {
            draw_line(x, y, from[?"x"]*w+w2, from[?"y"]*h+h2);
        }
    }
}

// Draw openSet
x += w + w2;
y = 0;
draw_set_color(c_lime);
draw_text(x, y, ds_priority_size(openSet));
draw_text(x, y+24, ds_priority_find_min(openSet));
draw_text(x, y+48, ds_priority_find_max(openSet));
