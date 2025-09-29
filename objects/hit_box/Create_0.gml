owner    = noone;
damage   = 12;
lifetime = 12;     // total frames the swing lasts

// rectangle size used for the tip’s AABB
w = 28;
h = 14;

// track already-hit targets (use map as a set)
targets_hit = ds_map_create();

// --- sweep config ---
age = 0;                  // frames since spawn
sweep_start  = -70;       // degrees (right-facing baseline)
sweep_end    =  70;       // degrees
sweep_frames = lifetime;  // how long to traverse start->end

/// push the lantern farther out
pivot_offx = 24;   // hand offset from owner.x (will mirror with facing)
pivot_offy = -32;  // hand height relative to owner.y
radius     = 100;  // distance from hand to lantern tip (increase this)


