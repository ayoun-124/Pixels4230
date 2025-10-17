w = (Player.bbox_right - Player.bbox_left) * 2.5;
h = w;

audio_play_sound(snd_glass_breaking, 1, false);
alarm[0] = swing_timer/5;
image_xscale = Player.image_xscale;