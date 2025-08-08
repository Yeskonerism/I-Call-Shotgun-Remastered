if (surface_exists(fog_surface)) {
    surface_free(fog_surface);
}
fog_surface = surface_create(room_width, room_height);
