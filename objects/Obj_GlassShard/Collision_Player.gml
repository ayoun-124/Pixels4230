// obj_shard_pickup: Collision with obj_player
if (!collected) {
    collected = true; // guard against double triggers
    obj_controller.gc_add_item(1);
    // audio_play_sound(snd_pickup, 1, false); 
    instance_destroy();
}
