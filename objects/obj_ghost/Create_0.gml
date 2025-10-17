// If this ghost was already killed earlier in this run, remove it now
if (gc_is_ghost_killed(ghost_id)) {
    instance_destroy();
    exit;
}

ghost_id = room_get_name(room) + ":" + string(xstart) + "," + string(ystart);


vspeed = hsp;