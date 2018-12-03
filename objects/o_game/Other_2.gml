//window_set_fullscreen(true);
window_set_min_width(960)
window_set_min_height(540)

display_reset(8, true);

globalvar stop_time;
stop_time = 0;
globalvar time_factor;
time_factor = 1;

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