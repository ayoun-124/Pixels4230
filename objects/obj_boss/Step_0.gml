
// (Optional) chase/phase logic here…

// Fire a cloned orb projectile
if (--shoot_cd <= 0 && is_array(orbs) && array_length(orbs) > 0) {
    var src = orbs[ irandom(array_length(orbs)-1) ];
    if (instance_exists(src)) {
        var dir = instance_exists(global.player)
                  ? point_direction(src.x, src.y, global.player.x, global.player.y)
                  : irandom(359);
        var b = instance_create_layer(src.x, src.y, "Instances", obj_boss_orb_shot);
        b.vx     = lengthdir_x(8, dir);
        b.vy     = lengthdir_y(8, dir);
        b.damage = 8;
        // match orb visuals (optional)
        b.sprite_index = src.sprite_index;
        b.mask_index   = src.mask_index;
    }
    shoot_cd = irandom_range(shoot_cd_min, shoot_cd_max);
}


