if (is_array(orbs)) {
    for (var i = 0; i < array_length(orbs); i++) {
        var o = orbs[i];
        if (instance_exists(o)) with (o) instance_destroy();
    }
}
