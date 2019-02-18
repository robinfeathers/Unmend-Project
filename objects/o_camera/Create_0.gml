

follow = noone;

/*with (o_base_entity)
{
	if Player_Object = true
	{
		other.follow = id
		break
	}
}*/

xto = x;
yto = y;

view_x = 0
view_y = 0

view_enabled = true
view_visible[0] = true
view_camera[0] = camera_create_view(0, 0, global.view_width, global.view_height, 0, -1, -1, -1, 0, 0);
cam = view_camera[0]

if instance_exists(o_vernal) {follow = o_vernal}
else if instance_exists(o_ship) {follow = o_ship}
else {follow = noone}