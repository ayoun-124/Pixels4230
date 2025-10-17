float_speed = 0.05;    // Smaller = slower, larger = faster
float_range = 10;      // How far up/down it moves
base_y = y;            // Store the original y position
float_counter = 0;     // Internal timer

key = room_get_name(room) + ":" + string(xstart) + "," + string(ystart);   // make a unique ID for THIS shard
if (ds_map_exists(global.gc.shards_collected_map, key)) {
    instance_destroy();                 // don’t respawn
    exit;
}
