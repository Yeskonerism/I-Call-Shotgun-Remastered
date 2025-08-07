function lerp_angle(a, b, amt) {
    var diff = angle_difference(a, b);
    return a + diff * amt;
}
