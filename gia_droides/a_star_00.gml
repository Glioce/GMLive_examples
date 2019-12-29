// init
room_speed = 1;
cols = 5;
rows = 5;
grid = ds_grid_create(cols, rows);
f = ds_grid_create(cols, rows); //f score
g = ds_grid_create(cols, rows); //g score
h = ds_grid_create(cols, rows); //h score

//openSet = ds_list_create();
//closedSet = ds_list_create();
openSetX = ds_list_create();
openSetY = ds_list_create();
openSetF = ds_list_create();
closedSetX = ds_list_create();
closedSetY = ds_list_create();
closedSetF = ds_list_create();

//Start = [0, 0];
//End = [cols - 1, rows - 1];
startX = 0;
startY = 0;
endX = cols - 1;
endY = rows - 1;

openSet_add(startX, startY, 0);

#define openSet_add
//add element
ds_list_add(openSetX, argument0);
ds_list_add(openSetY, argument1);
ds_list_add(openSetF, argument2);

#define openSet_delete
//delete element
ds_list_delete(openSetX, argument0);
ds_list_delete(openSetY, argument0);
ds_list_delete(openSetF, argument0);

#define closedSet_add
//add element
ds_list_add(closedSetX, argument0);
ds_list_add(closedSetY, argument1);
ds_list_add(closedSetF, argument2);

#define closedSet_delete
//delete element
ds_list_delete(closedSetX, argument0);
ds_list_delete(closedSetY, argument0);
ds_list_delete(closedSetF, argument0);

#define draw

// A* algorithm
if (ds_list_size(openSetF) > 0) {// keep going
    winner = 0; //winner index
    l = ds_list_size(openSetF);
    for (i = 0; i < l; i++) {
        if (openSetF[|i]  < openSetF[|winner]) winner = i;
    }
    current = winner;
    
    //check the end
    if (openSetX[|current] == endX and openSetY[|current] == endY) {
        trace("DONE!")
    }
    
    closedSet_add(openSetX[|current], openSetY[|current], openSetF[|current]);
    openSet_delete(current);
}
else {
    // no solution
}

// Draw grid
for (i = 0; i < rows; i++)
for (j = 0; j < cols; j++) {
    x = i * 32;
    y = j * 32;
    z = ds_grid_get(grid, i, j);
    if (z == 0) draw_set_color(c_white);
    else draw_set_color(c_black);
    draw_rectangle(x, y, x+30, y+30, false);
}
draw_set_color(c_white);

// Draw openSet
x += 64;
y = 0;
l = ds_list_size(openSetF);
for (i = 0; i < l; i++) {
    draw_text(x, y, openSetF[|i]);
    y += 16;
}

// Draw closedSet
x += 64;
y = 0;
l = ds_list_size(closedSetF);
for (i = 0; i < l; i++) {
    draw_text(x, y, closedSetF[|i]);
    y += 16;
}
