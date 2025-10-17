// Create Event of Obj_musicController

// Make sure global.bgm exists
if (!variable_global_exists("bgm")) {
    global.bgm = noone;
}

// If no music is playing, start it
if (global.bgm == noone || !audio_is_playing(global.bgm)) {
    global.bgm = audio_play_sound(snd_background, 1, true);
}
