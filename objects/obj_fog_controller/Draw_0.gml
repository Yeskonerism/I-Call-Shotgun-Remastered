if (!surface_exists(fog_surface)) {
    fog_surface = surface_create(room_width, room_height);
}

// Update fog surface
surface_set_target(fog_surface);
draw_clear_alpha(c_black, 0); // fully transparent

// Get background layer color
var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
var fog_color = layer_background_get_blend(back_id); // this is the color to draw

gpu_set_blendmode(bm_normal); // default blend mode
draw_set_color(fog_color);

for (var i = 0; i < fog_width; i++) {
    for (var j = 0; j < fog_height; j++) {
        var alpha = visible_grid[i][j];
        if (alpha > 0) {
            draw_set_alpha(alpha);

            var tile_x = i * tile_sz - view_xview[0];
            var tile_y = j * tile_sz - view_yview[0];

            draw_rectangle(tile_x, tile_y, tile_x + tile_sz - 1, tile_y + tile_sz - 1, false);
        }
    }
}

draw_set_alpha(1);
gpu_set_blendmode(bm_normal);
surface_reset_target();

// Draw the fog surface on screen
draw_surface(fog_surface, 0, 0);
