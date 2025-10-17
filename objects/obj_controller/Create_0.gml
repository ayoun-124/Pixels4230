// obj_game: Create
enum GameState { Boot, Menu, Playing, Paused, Dialogue, GameOver }

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


if (!variable_global_exists("gc")) global.gc = {};
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
