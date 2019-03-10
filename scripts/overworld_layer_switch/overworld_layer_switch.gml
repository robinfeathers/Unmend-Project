var layerobjs = argument[0]
var newlayer = argument[1]

for (var l = 0; l < array_height_2d(layerobjs); l += 1)
{
	if l != newlayer
	{
		for (var i = 0; i < array_length_2d(layerobjs, l); i += 1)
		{
			instance_deactivate_object(layerobjs[l, i])
		}
	}
	else
	{
		for (var i = 0; i < array_length_2d(layerobjs, l); i += 1)
		{
			instance_activate_object(layerobjs[l, i])
		}
	}
}