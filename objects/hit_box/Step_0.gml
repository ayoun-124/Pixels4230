// which instances can be hit?
var ENEMY_CLASS = Player; // <-- set to your enemy or parent

// 1) safety
if (!instance_exists(owner)) {
    if (ds_exists(targets_hit, ds_type_map)) ds_map_destroy(targets_hit);
    instance_destroy(); exit;
}

// 2) facing from owner (1 right, -1 left)
var facing = (owner.image_xscale >= 0) ? 1 : -1;

// 3) advance sweep angle
age++;
var t    = clamp(age / max(1, sweep_frames), 0, 1);
var ang  = lerp(sweep_start, sweep_end, t);
var wang = ang * facing; // mirror when facing left

// 4) compute pivot (hand) and tip position
var px = owner.x + pivot_offx * facing;
var py = owner.y + pivot_offy;
var tipx = px + lengthdir_x(radius, wang);
var tipy = py + lengthdir_y(radius, wang);

// keep instance position at the tip (useful for debug draw)
x = tipx; 
y = tipy;

// 5) lifetime / cleanup
lifetime--;
if (lifetime <= 0) {
    if (ds_exists(targets_hit, ds_type_map)) ds_map_destroy(targets_hit);
    instance_destroy(); exit;
}

// 6) collisions at the moving tip (AABB around the tip)
var l = tipx - w*0.5;
var ttop = tipy - h*0.5;
var r = tipx + w*0.5;
var b = tipy + h*0.5;

var list = ds_list_create();
var hits = collision_rectangle_list(l, ttop, r, b, ENEMY_CLASS, false, true, list, false);

// 7) apply damage once per target per swing
if (hits > 0) {
    for (var i = 0; i < hits; i++) {
        var e = list[| i];
        if (e == owner) continue; // safety

        if (!ds_map_exists(targets_hit, e)) {
            ds_map_add(targets_hit, e, true);

            with (e) {
                if (function_exists("take_damage")) {
                    take_damage(other.damage, other.owner);
                } else {
                    if (!variable_instance_exists(id, "hp")) hp = 100;
                    hp -= other.damage;
                    if (hp <= 0) instance_destroy();
                }
                // optional knockback if your enemies have hspd
                if (variable_instance_exists(id, "hspd")) {
                    hspd += (x < other.x) ? -3 : 3;
                }
            }
        }
    }
}
ds_list_destroy(list);
