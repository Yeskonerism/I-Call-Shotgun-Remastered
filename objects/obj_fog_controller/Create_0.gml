tile_sz = 8;

fog_width  = room_width div tile_sz // TILE_SIZE;
fog_height = room_height div tile_sz //TILE_SIZE;

explored_grid = [];
visible_grid  = [];

for (var i = 0; i < fog_width; i++) {
    explored_grid[i] = [];
    visible_grid[i]  = [];

    for (var j = 0; j < fog_height; j++) {
        explored_grid[i][j] = false;
        visible_grid[i][j]  = false;
    }
}

reveal_radius = 15;

fog_surface = -1;
