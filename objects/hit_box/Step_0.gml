// If the owner is gone, destroy the hitbox
if (!instance_exists(owner)) {
    ds_map_destroy(targets_hit);
    instance_destroy();
    exit;
}

// Attach the hitbox offset in front of the player
x = owner.x + dir * (w * 0.8);
y = owner.y;

// Count down the lifetime
lifetime--;
if (lifetime <= 0) {
    ds_map_destroy(targets_hit);
    instance_destroy();
    exit;
}

// Check for collisions with enemies
var list = ds_list_create();
if (collision_rectangle_list(x - w/2, y - h/2, x + w/2, y + h/2, Player, false, true, list, false)) {
    for (var i = 0; i < ds_list_size(list); i++) {
        var e = list[| i];
        if (!ds_map_exists(targets_hit, e)) {
            ds_map_add(targets_hit, e, true);
            with (e) {
                // Apply damage 
                    hp -= other.damage;
					if (hp<0) instance_destroy();
                
                // Optional knockback
                //hspd += other.dir * 3;
            }
        }
    }
}
ds_list_destroy(list);
