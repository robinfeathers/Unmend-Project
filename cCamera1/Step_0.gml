var followx = 0
var followy = 0
if followid != -1
{
	followx = followid.x
	followy = followid.y
}
var view_x_target = followx - global.view_width / 2// + dirshift
var view_y_target = followy - global.view_height / 2

if view_x_target < 0 {view_x_target = 0}
if view_y_target < 0 {view_y_target = 0}
if view_x_target > room_width - global.view_width {view_x_target = room_width - global.view_width}
if view_y_target > room_height - global.view_height {view_y_target = room_height - global.view_height}
	
if view_x != view_x_target {view_x += round(sign(view_x_target - view_x) * (1 + abs(view_x_target - view_x) / 10))}
if view_y != view_y_target {view_y += round(sign(view_y_target - view_y) * (1 + abs(view_y_target - view_y) / 10))}
if abs(view_x_target - view_x) < 1 {view_x = view_x_target}
if abs(view_y_target - view_y) < 1 {view_y = view_y_target}
	
var view_x_full = view_x
var view_y_full = view_y
	
camera_set_view_target(cam, -1)
camera_set_view_pos(cam, view_x_full, view_y_full)