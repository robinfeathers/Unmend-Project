//shader_set(shd_donkeykong)

if draw_ready
{
	draw_surface_ext(application_surface, (window_get_width()/2)-((global.view_width*global.gameScale)/2), (window_get_height()/2)-((global.view_height*global.gameScale)/2), global.gameScale, global.gameScale,0,c_white,1);
}

shader_reset()