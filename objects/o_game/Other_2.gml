//Establishing Tile Type Array
tile_types[0] = "blank";
tile_types[1] = "solid";
tile_types[2] = "solid_slope_left";
tile_types[3] = "solid_slope_right";
tile_types[4] = "blank";
tile_types[5] = "ridge";
tile_types[6] = "ridge_slope_left";
tile_types[7] = "ridge_slope_right";

display_reset(8, true);

paused = false;
surface = -1;
globalvar stop_time;
stop_time = 0;
globalvar time_factor;
time_factor = 1;

//window_set_fullscreen(true);
window_set_min_width(960)
window_set_min_height(540)



/*globalvar monitor_w;
monitor_w = display_get_width();
globalvar monitor_h;
monitor_h = display_get_gui_height();

globalvar x_offset;
x_offset = (monitor_w - 480)/2
globalvar y_offset;
y_offset = (monitor_h - 270)/2*/

//create_initial_script()