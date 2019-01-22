//window_set_fullscreen(true);
//window_set_min_width(960)
//window_set_min_height(540)

//display_reset(8, true);
randomize()

global.display_width = display_get_width();
global.display_height = display_get_height();

global.view_width = 480;
global.view_height = 270;

global.gameScale = 2;
global.game_Fullscreen = 0;

global.screen_width = global.view_width * global.gameScale;
global.screen_height = global.view_height * global.gameScale

draw_ready = false;

tile_layers = -1

application_surface_draw_enable(false);
surface_resize(application_surface, global.view_width, global.view_height);

if global.game_Fullscreen = 0
{
window_set_size(global.view_width*global.gameScale, global.view_height*global.gameScale);
alarm[1] = 1;
}
else
{
	window_set_fullscreen(true);
}
alarm[2] = 10;

globalvar stop_time;
stop_time = 0;
globalvar time_factor;
time_factor = 1;
globalvar pause;
pause = false;
pause_timer = 0;
pause_tab = 0;

//Establish Controller
globalvar controller;
controller = false;

/*globalvar monitor_w;
monitor_w = display_get_width();
globalvar monitor_h;
monitor_h = display_get_gui_height();

globalvar x_offset;
x_offset = (monitor_w - 480)/2
globalvar y_offset;
y_offset = (monitor_h - 270)/2*/

//create_initial_script()