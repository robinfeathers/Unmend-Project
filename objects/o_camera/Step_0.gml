if (follow != noone)
{
	xto = follow.x
	yto = follow.y - 48
	if follow.object_index == o_ship {yto = follow.y}
}
else
{
	xto = 0;
	yto = 0;
}

x += (xto - x)/10;
y += (yto - y)/10;

x = clamp(x, global.view_width / 2, room_width - global.view_width / 2)
y = clamp(y, global.view_height / 2, room_height - global.view_height / 2)

view_x = x - global.view_width / 2
view_y = y - global.view_height / 2

camera_set_view_target(cam, -1)
camera_set_view_pos(cam, view_x, view_y)
