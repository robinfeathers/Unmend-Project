if hit_count > 0
{
	if hit_delay > 0
	{
		hit_delay -= get_delta_time;
	}
	else
	{
		hit_delay = base_hit_delay;
		hit_count -= 1
		
		barrier_hit = 0;
		for(i=0; i<array_length_1d(barrier_hit); i++)
		barrier_array[i] = 0;
	}
}

var barrier_hit = other.id;
var do_nothing = false;
var i;
var ignore_character = false;

if slash_alliance == slash_faction.enemy and damage_type == "physical"
{
	for(i=0; i<array_length_1d(barrier_array); i++)
	{
		if barrier_array[i] == barrier_hit do_nothing = true;
	}
	if !do_nothing
	{
		barrier_array[barrier_listindex] = barrier_hit;
		barrier_listindex += 1;
		with barrier_hit
		{
			damage_absorbed += other.dmg;
			got_hit = true;
		}
	}
}
else show_debug_message(slash_alliance)

