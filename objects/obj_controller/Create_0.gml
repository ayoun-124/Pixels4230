
enum GameState { Boot, Menu, Playing, Paused, Dialogue, GameOver }

/// Persistent run state
global.gc = {
    health: 100,
    items_collected: 0,
    ghosts_killed: 0,
    health_max: 100,
	items_needed: 5,
};

global.game = {
    state: GameState.Boot,
    level: 1,
    score: 0,
    lives: 3,
	orb_count: 0,
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



global.gc.shards_collected_map = ds_map_create();

function shard_make_id(_inst) {
    // room name + original placement coords → stable across revisits
    return room_get_name(room) + ":" + string(_inst.xstart) + "," + string(_inst.ystart);
}

function gc_mark_shard_collected(key) {
    ds_map_set(global.gc.shards_collected_map, key, true); // create or overwrite
}

function gc_is_shard_collected(key) {
    return ds_map_exists(global.gc.shards_collected_map, key);
}


//God Mode Code

global.godMode = false;
godMode_timer = 0; // counts down in steps (frames)


// Safe distance to player (returns -1 if no player)
function dist_to_player() {
    if (instance_exists(global.player)) {
        return point_distance(x, y, global.player.x, global.player.y);
    }
    return -1;
}


flash_spr   = spr_red_hit;  // your overlay sprite
flash_timer = 0;              // counts down
flash_dur   = round(room_speed * 0.08); // ~0.08s flash
flash_max_a = 0.7;            // peak opacity









