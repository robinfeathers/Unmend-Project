if follow_creator
{
	x = creator.x;
	y = creator.y;
}

if hit_count > 0 and frame_goal == 0
{
	frame_goal = starting_frame + hit_delay;
}

if hit_count > 0 and floor(image_index) >= frame_goal
{
		show_debug_message("I'm running")
		frame_goal += hit_delay
		hit_count -= 1
		
		for(var i=0; i<array_length_1d(character_array); i++)
		character_array[i] = 0;
}