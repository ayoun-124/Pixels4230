
global.player = id;
hp = 100


// --- Dash vars ---
dash_speed = 12;     // faster than max_speed
dash_time = 30;      // frames the dash lasts
dash_cd = 24;       // cooldown in frames
dash_timer = 0;
dash_cooldown = 0;

// last non-zero move dir (for dashing from standstill)
dir_x = 1; 
dir_y = 0;

// (optional) i-frames timer if you want invulnerability during dash
invul_timer = 0;
