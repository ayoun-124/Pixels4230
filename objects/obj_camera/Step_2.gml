var target = instance_find(global.player, 0);



if (instance_exists(target)) {
    var target_x = target.x - camera_get_view_width(cam)  / 2;
    var target_y = target.y - camera_get_view_height(cam) / 2;

    // Clamp so you don’t see outside the room
    target_x = clamp(target_x, 0, room_width  - camera_get_view_width(cam));
    target_y = clamp(target_y, 0, room_height - camera_get_view_height(cam));

    // Smooth follow (lerp makes it glide)
    var cx = lerp(camera_get_view_x(cam), target_x, 0.1);
    var cy = lerp(camera_get_view_y(cam), target_y, 0.1);

    camera_set_view_pos(cam, cx, cy);
}
