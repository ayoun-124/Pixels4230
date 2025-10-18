var pad = 16;

// Use the readable font
draw_set_font(fnt_ui);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Build once (e.g., in controller Create) and reuse:

    global.hp_sprites = [
        spr_hp3, spr_hp2, spr_hp1, spr_hp0
    ];
	
	global.hp_boss_sprites = [
        spr_hp_boss3, spr_hp_boss2, spr_hp_boss1, spr_hp_boss0
    ];

// --- Sprite health bar (array) ---
var bx = pad, by = pad;
var steps  = array_length(global.hp_sprites) - 1;       // 10 here
var ratio  = clamp(global.gc.health / max(1, global.gc.health_max), 0, 1);
var idx    = round(ratio * steps);                      // 0..steps
var spr    = global.hp_sprites[idx];

draw_sprite(spr, 0, bx, by);


//draw health bar for boss if exists
if (instance_exists(obj_boss)){
	
	var dx = pad, dy = pad;
	var step  = array_length(global.hp_boss_sprites) - 1;       // 10 here
	var r  = clamp(global.boss.hp / max(1, 500), 0, 1);
	var idx0    = round(r * step);                      // 0..steps
	var bossSpr    = global.hp_boss_sprites[idx0];

	draw_sprite(bossSpr, 0, room_width , room_height);
}
// for layout below:
var bar_w = sprite_get_width(spr);
var bar_h = sprite_get_height(spr);



// --- Labels
draw_set_color(c_white);
var dy = pad + bar_h + 6;
//draw_text(pad, dy,         "Health:  " + string(global.gc.health));
//draw_text(pad, dy + 28,    "Ghosts: " + string(global.gc.ghosts_killed));


// Shards counter as “1/5”
//var shards_str = string(global.gc.items_collected) + "/" + string(global.gc.items_needed);
//draw_text(pad, dy + 56,    "Shards: " + shards_str);

global.shard_spr = [ spr_shard_0, spr_shard_1, spr_shard_2, spr_shard_3, spr_shard_4, spr_shard_5 ]
var spr2 = global.shard_spr[@ min(global.gc.items_collected, global.gc.items_needed)]
draw_sprite(spr2, 0, pad, dy + 56);


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

