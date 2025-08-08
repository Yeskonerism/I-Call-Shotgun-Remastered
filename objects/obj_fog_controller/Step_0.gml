var px = floor(obj_player.x / tile_sz);
var py = floor(obj_player.y / tile_sz);

var radius = reveal_radius;
var fade_start = radius * 0.6; // Start fading at 60% of radius

for (var i = 0; i < fog_width; i++) {
    for (var j = 0; j < fog_height; j++) {
        var dist = point_distance(px, py, i, j);

        if (dist <= fade_start) {
            // Fully visible zone: fade out fog alpha, mark explored
            visible_grid[i][j] = max(visible_grid[i][j] - 0.1, 0);
            explored_grid[i][j] = true;
        }
        else if (dist <= radius) {
            // Gradual fade from fade_start to radius
            var fade_alpha = (dist - fade_start) / (radius - fade_start);
            var target_alpha = clamp(fade_alpha * 0.6, 0, 0.6);

            if (visible_grid[i][j] < target_alpha) {
                // Only increase alpha if nearly fully opaque
                if (visible_grid[i][j] >= 0.99) {
                    visible_grid[i][j] = clamp(visible_grid[i][j] + 0.05, 0, target_alpha);
                }
                // else keep current alpha (no increase)
            } else {
                visible_grid[i][j] = clamp(visible_grid[i][j] - 0.1, target_alpha, 1);
            }

            explored_grid[i][j] = true;
        }
        else {
            // Outside vision radius
            if (explored_grid[i][j]) {
                // Explored but far: only increase alpha if fully opaque
                if (visible_grid[i][j] >= 0.99) {
                    visible_grid[i][j] = clamp(visible_grid[i][j] + 0.02, 0, 0.3);
                }
                // else keep current alpha (no increase)
            } else {
                // Unexplored: fade fog in fully
                visible_grid[i][j] = clamp(visible_grid[i][j] + 0.05, 0, 1);
            }
        }
    }
}
