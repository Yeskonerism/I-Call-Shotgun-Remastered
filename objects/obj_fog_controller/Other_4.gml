if (surface_exists(fog_surface)) {
    surface_free(fog_surface);
}
fog_surface = surface_create(room_width, room_height);

for (var i = 0; i < fog_width; i++) {
    for (var j = 0; j < fog_height; j++) {
        visible_grid[i][j] = 1;
        explored_grid[i][j] = false;
    }
}
