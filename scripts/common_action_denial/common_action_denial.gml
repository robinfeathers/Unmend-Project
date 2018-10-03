///@desc If any of these actions are true, return false
///@arg sliding
///@arg backstep
///@arg stinger
///@arg dash
///@arg dive_cutting
///@arg diving
///@arg holding_ledge
///@arg air_stepping

var done = false;

if argument[0] == true
{
	if sliding || slide_stopping
	{
		return false;
		done = true
	}
}

if argument[1] == true and done == false
{
	if backstep
	{
		return false;
		done = true
	}
}

if argument[2] == true and done == false
{
	if stinger
	{
		return false;
		done = true
	}
}

if argument[3] == true and done == false
{
	if dash
	{
		return false;
		done = true
	}
}

if argument[4] == true and done == false
{
	if dive_cutting
	{
		return false;
		done = true
	}
}

if argument[5] == true and done == false
{
	if diving
	{
		return false;
		done = true
	}
}

if argument[6] == true and done == false
{
	if holding_ledge
	{
		return false;
		done = true
	}
}

if argument[7] == true and done == false
{
	if air_stepping
	{
		return false;
		done = true
	}
}


//END
if !done return true;