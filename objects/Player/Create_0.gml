
global.player = id;
hp = 100

dash_speed      = 14;     // px per frame during dash
dash_len        = 2000;    // total dash distance (px)
dash_turn_gain  = 0.18;   // 0..1; lower = smoother arc, higher = snappier
dash_vx = 0; 
dash_vy = 0;
dash_dist_left = 0;
dash_cooldown = 0;
dash_timer = 0;
dash_cd = 0;

// last non-zero move dir (for dashing from standstill)
dir_x = 1; 
dir_y = 0;

// (optional) i-frames timer if you want invulnerability during dash
invul_timer = 0;
