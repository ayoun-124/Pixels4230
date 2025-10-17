
global.player = id;

hp = 100

/// obj_player: Create
enum State { Idle, Attack }
state       = State.Idle;
hit_pending = false;


// --- Dash vars ---
dash_speed = 12;     // faster than max_speed
dash_time = 30;      // frames the dash lasts
dash_cd = 24;       // cooldown in frames
dash_timer = 0;
dash_cooldown = 0;
dash_len = 500;

dash_turn_gain  = 0.18;   // 0..1; lower = smoother arc, higher = snappier
dash_vx = 0; 
dash_vy = 0;
dash_dist_left = 0;


// last non-zero move dir (for dashing from standstill)
dir_x = 1; 
dir_y = 0;

// (optional) i-frames timer if you want invulnerability during dash
invul_timer = 0;


touching_enemy_prev = false;  // were we touching an enemy last step?
hurt_knock = 10;               // knockback speed (px/step)
push_out_steps = 100;          // max pixels to nudge out of overlap

