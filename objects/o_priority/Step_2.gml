with o_overworldobject
{
	if rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, o_camera.view_x, o_camera.view_y, o_camera.view_x + global.view_width, o_camera.view_y + global.view_height)
	{
		depth = -(y - o_camera.view_y)
	}
}