save_01 = ds_map_create()
ds_map_add(save_01,"has_power_sword",false);
ds_map_add(save_01,"health",1000);

show_debug_message(ds_map_find_value(save_01,"health"));

