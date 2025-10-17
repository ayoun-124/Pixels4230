
if (state == State.Attack && hit_pending) {
    //instance_create_layer(x, y, "Instances", obj_player_hitbox);
    hit_pending = false;
	state        = State.Idle;
    sprite_index = spr_player_idle;
    image_speed  = 1;
    image_index  = 0;
}
