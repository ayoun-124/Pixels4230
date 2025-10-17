// --- Switch music depending on room ---
if (room == Room6) {
    if (global.currentTrackName != "boss") {
        // Stop current song and start boss music
        if (global.currentMusic != noone) audio_stop_sound(global.currentMusic);
        global.currentMusic = audio_play_sound(snd_final_boss, 1, true);
        global.currentTrackName = "boss";
    }
}
else {
    if (global.currentTrackName != "background") {
        // Stop boss music and return to normal
        if (global.currentMusic != noone) audio_stop_sound(global.currentMusic);
        global.currentMusic = audio_play_sound(snd_background, 1, true);
        global.currentTrackName = "background";
    }
}

