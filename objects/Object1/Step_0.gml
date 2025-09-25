// Config
var accel = 0.25;
var max_speed = 1.5;
var friction1 = 0.2;

// Input
var h = 0;
var v = 0;
if (keyboard_check(ord("A"))) h -= 1;
if (keyboard_check(ord("D"))) h += 1;
if (keyboard_check(ord("W"))) v -= 1;
if (keyboard_check(ord("S"))) v += 1;

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

// Move
x += hspeed;
y += vspeed;

// Player Step event
x = clamp(x, 0, room_width  - sprite_width);
y = clamp(y, 0, room_height - sprite_height);
