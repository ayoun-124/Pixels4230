var ang = point_direction(other.x, other.y, x, y)
hspeed = lengthdir_x(hurt_knock, ang);
vspeed = lengthdir_y(hurt_knock, ang);


        var i = 0;
        while (place_meeting(x, y, hit_box) && i < push_out_steps) {
            x += lengthdir_x(1, ang);
            y += lengthdir_y(1, ang);
            i++;
        }


