if (!instance_exists(owner)) { instance_destroy(); exit; }

orb_ang += orb_dps;
if (orb_ang >= 360) orb_ang -= 360;
if (orb_ang < 0)    orb_ang += 360;


x = owner.x + lengthdir_x(orb_r, orb_ang);
y = owner.y + lengthdir_y(orb_r, orb_ang);

// (Optional) pulse radius:
 orb_r = 64 + sin(current_time * 0.005) * 12;
