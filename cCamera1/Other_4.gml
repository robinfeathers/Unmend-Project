view_camera[0] = camera_create_view(0, 0, global.view_width, global.view_height, 0, oPlayer, -1, -1, 0, 0);
cam = view_camera[0]

if instance_number(oPlayer) == 1
{
	followid = oPlayer.id
}
else
{
	followid = id
}