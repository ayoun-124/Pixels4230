
show_debug_message("global.gc exists: " + string(global.gc != undefined));
show_debug_message("global.gc.killed_ghosts exists: " + string(global.gc.killed_ghosts != undefined));
ghost_id = room_get_name(room) + ":" + string(xstart) + "," + string(ystart);

// If this ghost was already killed earlier in this run, remove it now
if (obj_controller.gc_is_ghost_killed(ghost_id)) {
    instance_destroy();
    exit;
}

vspeed = hsp;

