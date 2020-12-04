// Experimenting with lightwiight objects
lwo = { a: 1, b: 2 };
//arr = [1, 2];
arr[0] = 1;
arr[1] = 2;
trace(lwo);
trace(arr);
ls = ds_list_create();
//ds_list_add(ls, lwo);
//ds_list_add(ls, { a: 1, b: 2 });
ds_list_add(ls, [22, 33]);
//gg = ds_list_find_value(ls, 0);
//gg = ls[|0];
arr[0] = 99;
trace(ds_list_find_value(ls, 0));
