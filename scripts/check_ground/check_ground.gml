var xpos = argument[0]
var ypos = argument[1]
if position_meeting(xpos, ypos, o_t_solid)
{
    return true
}
if position_meeting(xpos, ypos, o_t_solid_l_slope)
{
    return true
}
if position_meeting(xpos, ypos, o_t_solid_r_slope)
{
    return true
}
return false