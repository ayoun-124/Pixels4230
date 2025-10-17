
enum GameState { Boot, Menu, Playing, Paused, Dialogue, GameOver }

/// Persistent run state
global.gc = {
    health: 100,
    items_collected: 0,
    ghosts_killed: 0,
    health_max: 100,
	
};

global.game = {
    state: GameState.Boot,
    level: 1,
    score: 0,
    lives: 3,
    // any other global flags/data you want
};

// convenience access
function game_set_state(s) {
    global.game.state = s;
}

function game_is(s) {
    return global.game.state == s;
}



global.gc.killed_ghosts = ds_map_create();

// helpers
function gc_mark_ghost_killed(key) {
    ds_map_replace(global.gc.killed_ghosts, key, true);
}
function gc_is_ghost_killed(key) {
    return ds_map_exists(global.gc.killed_ghosts, key);
}
function gc_reset_run() { // call when starting a new game/run
    ds_map_clear(global.gc.killed_ghosts);
}





global.gc.room_pos = ds_map_create();   // room_name -> { x:..., y:... }

// Helpers
function gc_pos_key(_room) { return room_get_name(_room); }

function gc_save_player_pos(_player) {
    var k = gc_pos_key(room); // current room you're leaving
	ds_map_replace(global.gc.room_pos, k, {x: _player.x, y: _player.y});
}

function gc_try_restore_player_pos(_player) {
    var k = gc_pos_key(room); // room you're entering
    var p = global.gc.room_pos[? k];
    if (is_undefined(p)) return false;
    _player.x = p.x;
	_player.y = p.y;
    return true;
}
