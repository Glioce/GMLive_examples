// A* implementation v0.2
// Following pseudo-code from Wikipedia
// Added grid of obstacles
// Important: In GMLive, ds_priority_find_priority returns 0 if the
//     value is not found. The score of start is changed from 0 to 1.

// Create
room_speed = 6; //slow animation
cols = 13; //columns
rows = 12; //rows
w = 42; //cell width
h = 42; //cell height
w2 = w/2;
h2 = h/2;
grid = ds_grid_create(cols, rows); //nodes grid
obs = ds_grid_create(cols, rows); //obstacles grid

// Neighbors relative coordinates
arrX[0] = 1;
arrY[0] = 0;
arrX[1] = 0;
arrY[1] = -1;
arrX[2] = -1;
arrY[2] = 0;
arrX[3] = 0;
arrY[3] = 1;

// Init grid
for (i = 0; i < cols; i++)
for (j = 0; j < rows; j++) {
    cell = ds_map_create();
    ds_map_add(cell, "x", i); //horizontal pos
    ds_map_add(cell, "y", j); //vertical pos
    ds_map_add(cell, "f", 1.0*rows*cols); //f score
    ds_map_add(cell, "g", 1.0*rows*cols); //g score
    //ds_map_add(cell, "h", 0.0+rows+cols); //h score
    ds_map_add(cell, "from", -1); //came from
    ds_grid_set(grid, i, j, cell); //insert in grid
}

// Init obstacles grid
for (i = 0; i < cols; i++)
for (j = 0; j < rows; j++) {
    o = random(100) < 25; //is obstacle (true or false)
    ds_grid_set(obs, i, j, o); //insert in grid
}

// Start and goal nodes
start = ds_grid_get(grid, 0, 0);
goal = ds_grid_get(grid, cols-1, rows-1);
done = false; //algorithm can keep going

// Crate open set
openSet = ds_priority_create(); //discovered nodes

// Set cost for start node/cell
ds_map_replace(start, "g", 1); //initial cost
ds_map_replace(start, "f", 1 +
    point_distance(0, 0, goal[?"x"], goal[?"y"]));

// Initially, only start is known
ds_priority_add(openSet, start, start[?"f"]);


#define draw
// A* algorithm
if (done == false ) {
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
        gTemp = current[?"g"] + 1; //tentative g score
        for (i = 0; i < 4; i++) {
            //position of neighbor
            xx = current[?"x"] + arrX[i];
            yy = current[?"y"] + arrY[i];
            // if position is valid
            if (xx >=0 and xx < cols and yy >= 0 and yy < rows
            and ds_grid_get(obs, xx, yy) == 0) {
                neighbor = ds_grid_get(grid, xx, yy);
                // if this path to neighbor is better than any previous one
                if (gTemp < neighbor[?"g"]) {
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
} else {
    // no solution
    show_debug_message("NO SOLUTION")
    done = true;
}}

// Draw grid
// rectangles
//draw_set_color(c_white);
for (i = 0; i < cols; i++)
for (j = 0; j < rows; j++) {
    x = i * w;
    y = j * h;
    z = ds_grid_get(grid, i, j);
    if (ds_grid_get(obs, i, j) == 0) draw_set_color(c_white);
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
    draw_text(x, y, z[?"g"])
    draw_text(x, y+16, string_format(z[?"f"], 0, 1));
}
// lines
draw_set_color(c_red);
for (i = 0; i < cols; i++)
for (j = 0; j < rows; j++) {
    x = i * w + w2;
    y = j * h + h2;
    z = ds_grid_get(grid, i, j);
    from = z[?"from"];
    if (from <> -1) {
        draw_line(x, y, from[?"x"]*w+w2, from[?"y"]*h+h2);
    }
}

// Draw openSet
x += w;
y = 0;
draw_set_color(c_lime);
draw_text(x, y, ds_priority_size(openSet));
draw_text(x, y+24, ds_priority_find_min(openSet));
draw_text(x, y+48, ds_priority_find_max(openSet));
