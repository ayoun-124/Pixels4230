

    obj_controller.gc_mark_shard_collected(key);  // remember forever (this run)
    global.gc.items_collected += 1;    // update your HUD counter, if you track one
    instance_destroy();
