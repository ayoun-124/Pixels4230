debug = true;


base_dir  = (global.player.image_xscale >= 0) ? 0 : 180;      // direction in degrees
facing    = global.player.image_xscale ?? 1;       // for side-view fallback

// Cone settings
range_px  = 400;      // how far the light reaches
fov_deg   = 30;       // cone width (e.g., 90°)
duration  = 120;       // steps to stay active
tick_rate = 1;        // check every step

// Effects
do_damage     = true;
damage_amount = 1;
stun_frames   = 15;

// LoS check (turn off if you don’t want walls to block it)
require_los = true;

// Collision classes
enemy_parent = obj_ghost;  // set to your enemy parent or obj_enemy
solid_obj    = hit_box;  // used for line-of-sight


alarm[0] = room_speed;
