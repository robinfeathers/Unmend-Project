global.display_width = display_get_width();
global.display_height = display_get_height();

global.view_width = 400;
global.view_height = 300;

view_x = 0
view_y = 0

global.gameScale = 2;
global.gameFullscreen = 0;

global.screen_width = global.view_width * global.gameScale;
global.screen_height = global.view_height * global.gameScale;

draw_ready = false;

application_surface_draw_enable(false);
surface_resize(application_surface, global.view_width, global.view_height);

if (global.gameFullscreen = 0)
{
    window_set_size(global.view_width*global.gameScale, global.view_height*global.gameScale);
    alarm[1] = 1;
}
else
{
	window_set_fullscreen(true);
}

alarm[2] = 10;
