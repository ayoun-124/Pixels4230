var is_facing = (other.x - x) * image_xscale > 0;

//checks if player is attacking and facng the enemy
//mechanic has UB/edge case with is_facing condition
if ( state == State.Attack ){
	obj_controller.gc_mark_ghost_killed(other.ghost_id)
	obj_controller.gc_add_ghost_kill(1);
	instance_destroy(other);
	
}else {
	instance_destroy()
	//restart game
	game_restart()
}