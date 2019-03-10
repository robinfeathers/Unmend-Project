dir = 3
z = 1
z_shift = 1
rising = 0
rising_timer = -1

layers[0] = "Layer1"
layers[1] = "Layer2"

layerobjs[0, 0] = 0
for (var ind = 0; ind < array_length_1d(layers); ind += 1)
{
	var elements = layer_get_all_elements(layers[ind])
	var instcount = 0
	for (var e = 0; e < array_length_1d(elements); e += 1)
	{
		if layer_get_element_type(elements[e]) == layerelementtype_instance
		{
			layerobjs[ind, instcount] = layer_instance_get_instance(elements[e])
			instcount += 1
		}
	}
}

currentlayer = 0
overworld_layer_switch(layerobjs, currentlayer)