var groundobjs = [o_t_solid, o_t_solid_l_slope, o_t_solid_r_slope]
var xpos = argument[0]
var ypos = argument[1]

for (var i = 0; i < array_length_1d(groundobjs); i += 1)
{
	if position_meeting(xpos, ypos, groundobjs[i])
	{
		return true
	}
}

return false