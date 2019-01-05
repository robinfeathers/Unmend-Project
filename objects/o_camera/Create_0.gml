view_camera[0] = camera_create_view(0, 0, global.view_width, global.view_height, 0, -1, -1, -1, 0, 0);
cam = view_camera[0]

follow = noone;

/*with (o_base_entity)
{
	if Player_Object = true
	{
		other.follow = id
		break
	}
}*/

follow = o_vernal;

xto = x;
yto = y;

view_x = 0
view_y = 0