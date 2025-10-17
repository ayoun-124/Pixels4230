// find boss visual center (in case origin isn’t centered)
var cx = 0.5 * (owner.bbox_left + owner.bbox_right);
var cy = 0.5 * (owner.bbox_top  + owner.bbox_bottom);

// estimate “radius” of boss & orb
var boss_r = 0.5 * max(owner.bbox_right - owner.bbox_left,
                       owner.bbox_bottom - owner.bbox_top);
var orb_r_vis = 0.5 * max(sprite_get_width(sprite_index)  * abs(image_xscale),
                          sprite_get_height(sprite_index) * abs(image_yscale));

var margin = 8;  // extra spacing so it doesn’t clip
var base_orb_r = boss_r + orb_r_vis + margin;

// optional pulse
var pulse_amount = 10;
var pulse_speed  = 0.005;
orb_r = base_orb_r + sin(current_time * pulse_speed) * pulse_amount;

// place
n += 0.1;
x = cx + cos(n) * orb_r;
y = cy + sin(n) * orb_r;
