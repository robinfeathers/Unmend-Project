/// @description Setting up standard parameters
//Create macros

//THIS IS TO PREVENT A BUG
get_delta_time()

paused = false;
surface = -1;

//Establishing Tile Type Array
tile_types[0] = "blank";
tile_types[1] = "solid";
tile_types[2] = "solid_slope_left";
tile_types[3] = "solid_slope_right";
tile_types[4] = "blank";
tile_types[5] = "ridge";
tile_types[6] = "ridge_slope_left";
tile_types[7] = "ridge_slope_right";

//Create layers
layer_create(5,"Collision_Objects");
layer_create(6,"Player_&_Enemy_Objects");
layer_create(7,"Particle_Objects");
layer_create(8,"FX_Objects");

layer_create(19,"Mid_Game_UI");
layer_create(20,"Game");
instance_create_depth(0,0,20,o_camera)

if tile_layers != -1 {ds_list_destroy(tile_layers)}
tile_layers = ds_list_create()

// Creating Collision based on tile data
layers = layer_get_all()
tile_layer = -1
instance_layer = -1
for (var i = 0; i < array_length_1d(layers); i += 1)
{
	elements = layer_get_all_elements(layers[i])
	for (var j = 0; j < array_length_1d(elements); j += 1)
	{
		if layer_get_element_type(elements[j]) == layerelementtype_tilemap
		{
			tile_layer = layer_tilemap_get_id(layers[i])
			ds_list_add(tile_layers, tile_layer)
		}
		if layer_get_element_type(elements[j]) == layerelementtype_instance
		{
			instance_layer = layer_get_id(layers[i])	
		}
	}
}
instance_layer = layer_get_id("Collision_Objects")
if tile_layer != -1 and instance_layer != -1
{
	var tilesize = 16
	for (var i = 0; i < room_width; i += tilesize)
	{
		for (var j = 0; j < room_height; j += tilesize)
		{
			tile = tilemap_get_at_pixel(tile_layer, i, j)
			if tile != -1 and tile < array_length_1d(tile_types)
			{
				switch (tile_types[tile])
				{
					case "solid":
						instance_create_layer(i, j, instance_layer, o_t_solid)
						break
					case "solid_slope_left":
						instance_create_layer(i, j, instance_layer, o_t_solid_l_slope)
						break
					case "solid_slope_right":
						instance_create_layer(i, j, instance_layer, o_t_solid_r_slope)
						break
					case "ridge":
						instance_create_layer(i, j, instance_layer, o_t_ridge)
						break
					case "ridge_slope_left":
				
						instance_create_layer(i, j, instance_layer, o_t_ridge_l_slope)
						break
					case "ridge_slope_right":
						instance_create_layer(i, j, instance_layer, o_t_ridge_r_slope)
						break
				}				
			}
		}
	}	
}