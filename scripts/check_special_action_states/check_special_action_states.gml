///@desc check_for_actions
///@arg character_ground_pound
///@arg character_slide
///@arg character_air_step
///@arg character_dash
///@arg character_ledge_hold

if argument[0] == true
{
	if character_ground_pound == true return false;
}
if argument[1] == true
{
	if character_slide == true return false;
}
if argument[2] == true
{
	if character_air_step == true return false;
}
if argument[3] == true
{
	if character_dash == true return false;
}
if argument[4] == true
{
	if character_ledge_hold == true return false;
}
return true;