
enum GameState { Boot, Menu, Playing, Paused, Dialogue, GameOver }

/// Persistent run state
global.gc = {
    health: 100,
    items_collected: 0,
    ghosts_killed: 0,
    health_max: 100
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
