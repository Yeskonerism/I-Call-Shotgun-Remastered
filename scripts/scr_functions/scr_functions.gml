function lerp_angle(a, b, amt) {
    var diff = angle_difference(a, b);
    return a + diff * amt;
}

/// @function collision_line_width_list(x1, y1, x2, y2, width, obj, prec, notme)
/// @desc Returns a list of instances within a "wide" line (ray) by casting multiple lines.
function collision_line_width_list(x1, y1, x2, y2, width, obj, prec, notme) {
    var result = ds_list_create();

    // Loop through all instances of the object
    with (obj) {
        if (prec && !sprite_exists(sprite_index)) return;

        // Only check valid enemies
        if (!instance_exists(id)) return;

        var dist = point_distance_to_line(x, y, x1, y1, x2, y2);
        if (dist <= width) {
            ds_list_add(result, id);
        }
    }

    return result;
}


function point_distance_to_line(px, py, x1, y1, x2, y2) {
    var dx = x2 - x1;
    var dy = y2 - y1;

    if (dx == 0 && dy == 0) {
        // The line is just a point
        return point_distance(px, py, x1, y1);
    }

    var t = ((px - x1) * dx + (py - y1) * dy) / (dx * dx + dy * dy);
    t = clamp(t, 0, 1);

    var closest_x = x1 + t * dx;
    var closest_y = y1 + t * dy;

    return point_distance(px, py, closest_x, closest_y);
}

function string_wrap(_str, _width) {
    var output = "";
    var line = "";
    var words = string_split(_str, " ");
    
    for (var i = 0; i < array_length(words); i++) {
        var test_line = line == "" ? words[i] : line + " " + words[i];
        if (string_width(test_line) > _width) {
            output += line + "\n";
            line = words[i];
        } else {
            line = test_line;
        }
    }
    output += line;
    return output;
}