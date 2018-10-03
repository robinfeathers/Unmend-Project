x += (xto - x)/10;
y += (yto - y)/10;

if (follow != noone)
{
	xto = follow.x
	yto = follow.y - 48
}
if x <= 240 x = 240
if x >= room_width - 240 x = room_width - 240
if y <= 135 y = 135
if y >= room_height - 135 y = room_height - 135

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(camera,vm);
