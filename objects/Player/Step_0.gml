// Config
var accel = 0.25;
var max_speed = 2.5;
var friction1 = 0.2;





var h = 0;
var v = 0;
if (keyboard_check(ord("A")) && state != State.Attack){
	
	h -= 1;
	image_xscale = -1;
	sprite_index  = Spr_Walking;
	
}
if (keyboard_check(ord("D")) && state != State.Attack){
	
	h += 1;
	image_xscale = 1;
	sprite_index  = Spr_Walking;
	
}
if (keyboard_check(ord("W")) && state != State.Attack){
	
	v -= 1;
	
}
if (keyboard_check(ord("S")) && state != State.Attack){
	v += 1;
	sprite_index = spr_upDown;
	
}


facing = image_xscale;

/// SECONDARY: lamp shine (press J)
if (keyboard_check_pressed(ord("J")) && state != State.Attack) {
    state        = State.Attack;
    sprite_index = spr_player_attack_2; // optional toss/shine anim
    image_index  = 0;
    image_speed  = 0.4;

    // spawn the forward cone
    var lamp = instance_create_layer(x, y, "Instances", obj_lamp_cone);
    lamp.owner   = id;
    lamp.facing  = image_xscale;         // +1 right / -1 left (side/top-down)
    lamp.base_dir= (image_xscale >= 0) ? 0 : 180; // side-view default

    // TOP-DOWN aim:
    // if you rotate the player with image_angle, use:
    // lamp.base_dir = image_angle;
    // Or if you want it to use mouse aim:
    // lamp.base_dir = point_direction(x, y, mouse_x, mouse_y);

    // brief recovery so you don’t instantly snap to idle (optional)
    alarm[2] = 60;
}



/// primary attack
if (keyboard_check_pressed(ord("H")) && state != State.Attack) {
    state        = State.Attack;
    sprite_index = spr_player_attack;
    image_index  = 0;
    image_speed  = 0.8;
    hit_pending  = true;

	audio_play_sound(snd_swing, 1, false);
	alarm[1] = room_speed / 2;
	
	//delay hitbox for swing animation
    var delay_seconds = 0.50;
    var fps_target    = game_get_speed(gamespeed_fps);
    alarm[0] = max(1, round(delay_seconds * fps_target));
}



// Remember last non-zero move direction (used if you dash while idle)
if (h != 0 || v != 0) {
    var L = point_distance(0,0,h,v);
    dir_x = h / L; 
    dir_y = v / L;
}

// timers
if (dash_cooldown > 0) dash_cooldown--;
if (invul_timer   > 0) invul_timer--;

if (keyboard_check_pressed(vk_shift) && dash_timer <= 0 && dash_cooldown <= 0) {
    var dx = (h != 0 || v != 0) ? h : dir_x;
    var dy = (h != 0 || v != 0) ? v : dir_y;
    var L  = point_distance(0,0,dx,dy); if (L == 0) L = 1;
    dx /= L; dy /= L;

    // current dash direction vector
    dash_vx = dx;
    dash_vy = dy;

    dash_dist_left = dash_len;
    dash_timer     = ceil(dash_len / dash_speed); // keep time in sync with distance
    dash_cooldown  = dash_cd;
    invul_timer    = max(invul_timer, dash_timer);
}



if (dash_timer > 0) {
    dash_timer--;

    // Desired direction from input; if none, keep current dash heading
    var inx, iny;
    if (h != 0 || v != 0) {
        var il = point_distance(0,0,h,v);
        inx = h / il; 
        iny = v / il;
    } else {
        inx = dash_vx; 
        iny = dash_vy;
    }

    // Smoothly blend current heading toward desired (no hook/kink)
    dash_vx = dash_vx * (1 - dash_turn_gain) + inx * dash_turn_gain;
    dash_vy = dash_vy * (1 - dash_turn_gain) + iny * dash_turn_gain;

    // Normalize (nlerp)
    var nl = point_distance(0,0,dash_vx,dash_vy);
    if (nl > 0) { dash_vx /= nl; dash_vy /= nl; } 
    else { dash_vx = inx; dash_vy = iny; }

    // Move at constant dash_speed
    var step_dx = dash_vx * dash_speed;
    var step_dy = dash_vy * dash_speed;

    x += step_dx;
    y += step_dy;

    dash_dist_left -= point_distance(0,0,step_dx,step_dy);
    if (dash_dist_left <= 0) dash_timer = 0;  // end exactly at dash_len

    // Keep your clamps if you need them
    x = clamp(x, 0, room_width  - 100);
    y = clamp(y, 0, room_height - 100);

    exit; // skip normal accel/friction while dashing
}





// Normalize diagonal input
if (h != 0 || v != 0) {
    var len = point_distance(0,0,h,v);
    h /= len;
    v /= len;
}

// Accelerate toward input
hspeed = clamp(hspeed + h * accel, -max_speed, max_speed);
vspeed = clamp(vspeed + v * accel, -max_speed, max_speed);

// Apply friction when no input
if (h == 0) hspeed = lerp(hspeed, 0, friction1);
if (v == 0) vspeed = lerp(vspeed, 0, friction1);

if (h == 0 && v == 0 && state != State.Attack){
	sprite_index = spr_player_idle;
}

x += hspeed;
y += vspeed;

x = clamp(x, 50, room_width);
y = clamp(y, bbox_top, room_height - 100);






