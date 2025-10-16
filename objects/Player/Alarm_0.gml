
if (state == State.Attack && hit_pending) {
    instance_create_layer(x, y, "Instances", obj_player_hitbox);
    hit_pending = false;
}
