// obj_shard_pickup: Collision with obj_player
if (!collected) {
    collected = true; // guard against double triggers
    global.gc.items_collected = min(global.gc.items_collected + 1, 5);
    // audio_play_sound(snd_pickup, 1, false); 
    instance_destroy();
}
