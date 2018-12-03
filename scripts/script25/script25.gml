if(hsp != 0)
{
	repeat (1)
	{
		if (x>0)
		{
			if (place_meeting(x,y,o_t_solid))
			{
				x=x-1
				show_debug_message("BAD_01")
			}
			else
			{
				x=x+1
				show_debug_message("BAD_02")
			}
		}
		if (x<=0)
		{
			if (place_meeting(x,y,o_t_solid))
			{
				x=x+1
				show_debug_message("BAD_03")
			}
			else
			{
				x=x-1
				show_debug_message("BAD_04")
			}
		}
	}
}