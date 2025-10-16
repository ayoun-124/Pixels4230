if (instance_exists(Player)) {
    var dist = distance_to_object(Player);
    if (dist < attack_range) {
        path_end(); 


        direction = point_direction(x, y, Player.x, Player.y);
        speed = hsp; 
    }
}

