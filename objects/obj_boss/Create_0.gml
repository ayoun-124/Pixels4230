global.boss = id
hp = global.game.boss_health;
state = 0;
target = global.player ?? noone;

// Orbit ring
orb_count  = 8;
orb_radius = 64;
orb_speed  = 2.5;   // deg/step CCW
orb_sprite = spr_orb;

// Shooter
shoot_cd_min = 36;  // 0.6s @60fps
shoot_cd_max = 60;  // 1.0s
shoot_cd     = irandom_range(shoot_cd_min, shoot_cd_max);

// Keep handles to orbs
orbs = [];
for (var i = 0; i < orb_count; i++) {
    var ang = i * (360 / orb_count);
	
    var o = instance_create_layer(x, y, "Instances", obj_boss_orb);
    o.owner       = id;
    o.orb_ang     = ang;
    o.orb_r       = orb_radius;
    o.orb_dps     = orb_speed;
    o.sprite_index = orb_sprite;
    array_push(orbs, o);
}
