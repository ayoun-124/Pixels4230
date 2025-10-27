// Make sure the controller persists across rooms
persistent = true;

// Track current song
global.currentMusic = noone;

// Start normal background music
global.currentMusic = snd_background
audio_play_sound(snd_background, 1, true);
global.currentTrackName = "background";

