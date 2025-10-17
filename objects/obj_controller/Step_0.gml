
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
	audio_play_sound(snd_health_loss, 1, false);
    if (global.gc.health <= 0) {
        // handle game over here if you want
        // room_restart(); or set a GameOver state later
		game_restart();
    }
}


if (keyboard_check_pressed(ord("N"))) {
	room_goto_next();

}




// --- Activate God Mode when G is pressed ---
if (keyboard_check_pressed(ord("G"))) {
    global.godMode = true;
    godMode_timer = room_speed * 10; // lasts 10 seconds
}

// --- While God Mode is active ---
if (global.godMode) {
    // Keep player "invincible"
    global.gc.health = global.gc.health_max;

    // Countdown
    godMode_timer -= 1;

    // When time runs out, disable god mode
    if (godMode_timer <= 0) {
        global.godMode = false;

        // Return health to normal (optional: just keep it at max)
        if (global.gc.health > global.gc.health_max) {
            global.gc.health = global.gc.health_max;
        }
    }
}



