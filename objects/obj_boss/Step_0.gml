
// (Optional) chase/phase logic here…
var p = instance_nearest(x, y, Player);
if (p != noone) {
    var stop_radius = 48;          // don’t stand on top of the player
    var dist = point_distance(x, y, p.x, p.y);
    if (dist > stop_radius) {
        var dir = point_direction(x, y, p.x, p.y);
        speed = 1.2;           // pixels/step (slow creep)
        move_towards_point(p.x, p.y, speed);
        
    } else {
        speed = 0;
    }
}



var d = obj_controller.dist_to_player();

// Fire a cloned orb projectile
if (--shoot_cd <= 0 && is_array(orbs) && array_length(orbs) > 0 && global.game.orb_count <= 10 ) {
    var src = orbs[ irandom(array_length(orbs)-1) ];
    if (instance_exists(src)) {
        var dir = instance_exists(global.player)
                  ? point_direction(src.x, src.y, global.player.x, global.player.y)
                  : irandom(359);
        var b = instance_create_layer(src.x, src.y, "Instances", obj_boss_orb_shot);
        b.vx     = lengthdir_x(8, dir);
        b.vy     = lengthdir_y(8, dir);
        b.damage = 8;
        
    }
    shoot_cd = irandom_range(shoot_cd_min, shoot_cd_max);
}


if ( hp <= 0 ){
	
	room_goto(WinScreen)
	instance_destroy();
	
}