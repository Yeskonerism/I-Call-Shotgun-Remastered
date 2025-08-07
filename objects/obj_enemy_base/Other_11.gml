if(path_exists(path)) path_delete(path);
path = path_add();

mp_grid_path(global.grid, path, x, y, start_pos[0], start_pos[1], true);

path_start(path, walksp, path_action_stop, true);