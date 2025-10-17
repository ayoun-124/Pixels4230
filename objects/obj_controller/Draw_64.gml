var w = display_get_gui_width();
var pad = 16;

// Health bar
var hp  = global.gc.health;
var hpm = global.gc.health_max;
var bar_w = 200, bar_h = 14;

draw_set_color(c_black);
draw_rectangle(pad-2, pad-2, pad+bar_w+2, pad+bar_h+2, false);

draw_set_color(c_red);
draw_rectangle(pad, pad, pad + bar_w * (hp / max(1,hpm)), pad + bar_h, false);

draw_set_color(c_white);
draw_text(pad, pad + 22, "Items: " + string(global.gc.items_collected));
draw_text(pad, pad + 22 + 18, "Ghosts: " + string(global.gc.ghosts_killed));
