if (state == State.Attack && sprite_index == spr_player_attack) {
    state        = State.Idle;
    sprite_index = spr_player_idle;
    image_speed  = 1;
    image_index  = 0;
}


if (sprite_index == Spr_Walking && sprite_index == spr_upDown) {
    state        = State.Idle;
    sprite_index = spr_player_idle;
    image_speed  = 1;
    image_index  = 0;
}
