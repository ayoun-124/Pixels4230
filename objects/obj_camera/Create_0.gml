// Get room dimensions
var cam_w = 2000;   // camera width
var cam_h = 2000;   // camera height

// Create a new camera
cam = camera_create_view(0, 0, cam_w, cam_h, 0, noone, 0, 0);

// Assign it to viewport 0
view_enabled = true;
view_set_camera(0, cam);
view_set_visible(0, true);
