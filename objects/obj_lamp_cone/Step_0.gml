if (instance_exists(owner)) {
    var w  = (owner.bbox_right - owner.bbox_left);
    var h  = (owner.bbox_bottom - owner.bbox_top);
    var sx = sign(owner.image_xscale);           // +1 right, -1 left

    base_dir = (sx >= 0) ? 0 : 180;              // face

    var off_forward = 0.75 * w;                  // how far in front
    var off_vertical = h * 0.33;                 // slight down from center

    x = owner.x + sx * off_forward;              // <-- no world mirroring
    y = owner.y + off_vertical;

    image_angle = base_dir;                      // if you’re using a cone sprite
} else {
    instance_destroy(); exit;
}




duration--;
if (duration <= 0) instance_destroy();
