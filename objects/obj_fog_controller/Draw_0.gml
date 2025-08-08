if (!surface_exists(fog_surface)) {
    fog_surface = surface_create(room_width, room_height);
}

// Set the surface as the target and draw fog to it
surface_set_target(fog_surface);
draw_clear_alpha(c_black, 0); // clear surface transparent

for (var i = 0; i < fog_width; i++) {
    for (var j = 0; j < fog_height; j++) {
        var alpha = visible_grid[i][j];
        if (alpha > 0) {
            draw_set_alpha(alpha);
			draw_set_color(c_black);
            var tile_x = i * tile_sz - view_xview[0];
            var tile_y = j * tile_sz - view_yview[0];
            draw_rectangle(tile_x, tile_y, tile_x + tile_sz-1, tile_y + tile_sz-1, false);
        }
    }
}

draw_set_alpha(1);
surface_reset_target();

draw_surface(fog_surface, 0, 0);


