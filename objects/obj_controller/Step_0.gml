
// convenience helpers
function gc_reset_run() {
    global.gc.health          = global.gc.health_max;
    global.gc.items_collected = 0;
    global.gc.ghosts_killed   = 0;
}

function gc_add_item(n) {
    global.gc.items_collected += n;
}

function gc_add_ghost_kill(n) {
    global.gc.ghosts_killed += n;
}

function gc_add_health(n) {
    global.gc.health = clamp(global.gc.health + n, 0, global.gc.health_max);
}

function gc_take_damage(n) {
    global.gc.health = clamp(global.gc.health - n, 0, global.gc.health_max);
    if (global.gc.health <= 0) {
        // handle game over here if you want
        // room_restart(); or set a GameOver state later
    }
}
