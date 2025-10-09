// Config
var accel = 0.25;
var max_speed = 2.5;
var friction1 = 0.2;



var h = 0;
var v = 0;
if (keyboard_check(ord("A"))){
	
	h -= 1;
	image_xscale = -1;
	
}
if (keyboard_check(ord("D"))){
	h += 1;
	image_xscale = 1;
}
if (keyboard_check(ord("W"))){
	v -= 1;
		
	
}
if (keyboard_check(ord("S"))) v += 1;


facing = image_xscale;

// Remember last non-zero move direction (used if you dash while idle)
if (h != 0 || v != 0) {
    var L = point_distance(0,0,h,v);
    dir_x = h / L; 
    dir_y = v / L;
}

// timers
if (dash_cooldown > 0) dash_cooldown--;
if (invul_timer   > 0) invul_timer--;

// Start DASH (Shift)
if (keyboard_check_pressed(vk_shift) && dash_timer <= 0 && dash_cooldown <= 0) {
    var dx = (h != 0 || v != 0) ? h : dir_x;
    var dy = (h != 0 || v != 0) ? v : dir_y;
    var L  = point_distance(0,0,dx,dy); if (L == 0) L = 1;
    dx /= L; dy /= L;

    hspeed = dx * dash_speed;
    vspeed = dy * dash_speed;

    dash_timer    = dash_time;
    dash_cooldown = dash_cd;
    invul_timer   = max(invul_timer, dash_time); // remove if you don't want i-frames
}

// If dashing, override normal movement this frame and exit early
if (dash_timer > 0) {
    dash_timer--;
    x += hspeed;
    y += vspeed;

    // keep your clamps
    x = clamp(x, 0, room_width  - sprite_width);
    y = clamp(y, 0, room_height - sprite_height);

    exit; // skip your normal accel/friction code below while dashing
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


x += hspeed;
y += vspeed;

x = clamp(x, 50, room_width - 100);
y = clamp(y, 100, room_height - 100);

if (keyboard_check_pressed(vk_space)) {
    var hb = instance_create_layer(x, y, "Instances", hit_box);
    hb.owner = id;
    hb.dir = facing; // assume facing is 1 or -1
}

