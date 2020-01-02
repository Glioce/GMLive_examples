// A* FOR PLATFORMER V0.1
// Modified version of previous A* implementation.
// Nodes are created over platforms only.
// Following pseudo-code from Wikipedia
// Important: In GMLive, ds_priority_find_priority returns 0 if
// the value is not found, so the g score of start is 1 intead of 0.

// Create
room_speed = 30; //slow animation
cols = 15; //columns
rows = 13; //rows
w = 40; //cell width
h = 40; //cell height
w2 = w/2;
h2 = h/2;
// platofrms and nodes are inserted in the same grid
grid = ds_grid_create(cols, rows); //nodes grid
//obs = ds_grid_create(cols, rows); //obstacles grid

// Neighbors relative coordinates
// not used in this version
/*arrX[0] = 1; //right
arrY[0] = 0;
arrX[1] = 0; //up
arrY[1] = -1;
arrX[2] = -1; //left
arrY[2] = 0;
arrX[3] = 0; //down
arrY[3] = 1;
*/
// Nodes relative coordinates
/*arrX[0] = 1; //right
arrX[1] = 0; //up
arrX[2] = -1; //left
*/

// array of g scores
// not used in this version
/*arrG[0] = 2; //right
arrG[1] = 4; //up
arrG[2] = 2; //left
arrG[3] = 1; //down
*/

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
// last row filled with blocks
for (i = 0; i < cols; i++) {
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
start[?"f"] = 1 + point_distance(0, 0, goal[?"x"], goal[?"y"]); //f score
start[?"from"] = -1; //came from
ds_grid_set(grid, i, j, start); //insert in grid

// Nodes over platforms
for (i = 0; i < cols; i++)
for (j = 1; j < rows; j++) {
    if (ds_grid_get(grid, i, j) == block) {//create nodes
        for (k = -1; k <= 1; k++) {
            xx = i + k;
            yy = j - 1;
            // if position is valid (within grid and empty)
            if (xx >=0 and xx < cols and yy >= 0 and yy < rows
            and ds_grid_get(grid, i, yy) <> block
            and ds_grid_get(grid, xx, yy) == empty) {
                node = ds_map_create();
                node[?"x"] = xx; //horizontal pos
                node[?"y"] = yy; //vertical pos
                node[?"f"] = -1; //f score not calculated
                node[?"g"] = -1; //g score not calculated
                node[?"from"] = -1; //came from
                ds_grid_set(grid, xx, yy, node); //insert in grid
            }
        }
    }
}

// Start and goal nodes

//goal = ds_grid_get(grid, cols-1, 0);

// Crate open set
openSet = ds_priority_create(); //discovered nodes
// Initially, only start is known
//ds_priority_add(openSet, start, start[?"f"]);
//done = false; //algorithm can keep going


#define draw
// A* algorithm
/*if (done == false ) {
if not ds_priority_empty(openSet) {// keep going
    // the node in openSet having the lowest f score
    current = ds_priority_delete_min(openSet);
    
    if (current == goal) {
        // return reconstruct_path(cameFrom, current)
        show_debug_message("DONE");
        done = true;
    }
    else {
        // for each neighbor of current
        for (i = 0; i < 4; i++) {
        */
            /*if (i == 1) {
                from = current[?"from"];
                if (from[?"y"] > current[?"y"]) arrG[1] += 4;
                else arrG[1] = 4;
            }*/
/*            gTemp = current[?"g"] + arrG[i]; //tentative g score
            //position of neighbor
            xx = current[?"x"] + arrX[i];
            yy = current[?"y"] + arrY[i];
            // if position is valid
            if (xx >=0 and xx < cols and yy >= 0 and yy < rows
            and ds_grid_get(obs, xx, yy) == 0) {
                neighbor = ds_grid_get(grid, xx, yy);
                // if this path to neighbor is better than any previous one
                if (gTemp < neighbor[?"g"] or neighbor[?"g"] == -1) {
                    neighbor[?"from"] = current;
                    neighbor[?"g"] = gTemp;
                    neighbor[?"f"] = gTemp +
                        point_distance(xx, yy, goal[?"x"], goal[?"y"]);
                        
                    if (ds_priority_find_priority(openSet, neighbor) <= 0) 
                        ds_priority_add(openSet, neighbor, neighbor[?"f"]);
                }
            }
        }
    }
} else {// openSet is empty, no solution
    show_debug_message("NO SOLUTION")
    done = true;
}}
*/

// Draw grid
// rectangles
//draw_set_color(c_white);
for (i = 0; i < cols; i++)
for (j = 0; j < rows; j++) {
    x = i * w;
    y = j * h;
    z = ds_grid_get(grid, i, j);
    if (z == block) draw_set_color(c_gray);
    else draw_set_color(c_white);
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
        draw_text(x, y, z[?"g"])
        draw_text(x, y+16, string_format(z[?"f"], 0, 1));
    }
}
// lines
/*draw_set_color(c_red);
for (i = 0; i < cols; i++)
for (j = 0; j < rows; j++) {
    x = i * w + w2;
    y = j * h + h2;
    z = ds_grid_get(grid, i, j);
    from = z[?"from"];
    if (from <> -1) {
        draw_line(x, y, from[?"x"]*w+w2, from[?"y"]*h+h2);
    }
}*/

// Draw openSet
x += w + w2;
y = 0;
draw_set_color(c_lime);
draw_text(x, y, ds_priority_size(openSet));
draw_text(x, y+24, ds_priority_find_min(openSet));
draw_text(x, y+48, ds_priority_find_max(openSet));
