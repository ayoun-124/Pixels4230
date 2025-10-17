var pad = 16;

// Use the readable font
draw_set_font(fnt_ui);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// --- Health bar (optional, slightly bigger)
var hp = global.gc.health, hpm = max(1, global.gc.health_max);
var bar_w = 220, bar_h = 18;

draw_set_color(c_white);
draw_rectangle(pad-2, pad-2, pad+bar_w+2, pad+bar_h+2, false);
draw_set_color(c_red);
draw_rectangle(pad, pad, pad + bar_w * (hp/hpm), pad + bar_h, false);

// --- Labels
draw_set_color(c_white);
var dy = pad + bar_h + 6;
draw_text(pad, dy,         "Health:  " + string(global.gc.health));
draw_text(pad, dy + 28,    "Ghosts: " + string(global.gc.ghosts_killed));

// Shards counter as “1/5”
var shards_str = string(global.gc.items_collected) + "/" + string(global.gc.items_needed);
draw_text(pad, dy + 56,    "Shards: " + shards_str);


if (flash_timer > 0) {
    var gw = display_get_gui_width();
    var gh = display_get_gui_height();

    var t = flash_timer / flash_dur;     // 1 → 0
    var a = flash_max_a * t * t;         // ease-out

    draw_set_alpha(a);
    draw_sprite_stretched(flash_spr, 0, 0, 0, gw, gh); // use subimage 0
    draw_set_alpha(1);

    flash_timer--;
}




if (global.godMode) {
    draw_set_color(c_yellow);
    draw_text(16, 150, "GOD MODE: " + string(round(godMode_timer / room_speed)) + "s");
} else {
    draw_set_color(c_white);
    draw_text(16, 150, "GOD MODE: OFF");
}

