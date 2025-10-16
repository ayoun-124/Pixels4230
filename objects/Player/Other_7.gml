if (state == State.Attack && sprite_index == spr_player_attack) {
    state        = State.Idle;
    sprite_index = spr_player_idle;
    image_speed  = 1;
    image_index  = 0;
}
