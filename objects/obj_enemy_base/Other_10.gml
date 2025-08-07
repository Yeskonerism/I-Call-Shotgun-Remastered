if(path_exists(path)) path_delete(path);
path = path_add();

mp_grid_path(global.grid, path, x, y, target_pos[0], target_pos[1], true);

path_start(path, walksp, path_action_stop, true);