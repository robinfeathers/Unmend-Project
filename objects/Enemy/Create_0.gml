/// @description Declare parent Vars
//Standard animations
/*idle_sprite = s_e_george_idle;
stunned_sprite = s_e_george_stunned;
launch_up_h_sprite = s_e_george_launch01;
launch_down_sprite = s_e_george_launch02
bounce_wall_sprite = s_e_george_bounce01;
bounce_floor_sprite = s_e_george_bounce02;
sleep_sprite = s_e_george_sleep;
wake_sprite = s_e_george_wake;
mask_index = s_e_george_idle;*/

//Movement vars
hsp = 0;
vsp = 0;
max_hsp = 1.6;
max_slopesp = 1.4;
max_airhsp = 1.4;
max_fallsp = 1.4;
//walksp = .2;
max_slopesp = 3;
launchup_sp = -5.25;
launchdown_sp = 6;
bounce_sp = -2;
max_sleepduration = 45;
sleepduration = 0;
responds_to_step = false;

//Stat vars
/*hp = 0;
poise_max = 8;*/
poise = poise_max;
poise_index = 0;

//Status tracking
my_direction = image_xscale;
shake = 0;
got_hit = false;
//max_stunduration = 50;
stunduration = max_stunduration;
//poise_regen_time_max = 75;
poise_regen_time = 0;
//poise_regen_rate = .2;
launchingup = false;
launchingdown = false;
launchinghorizontal = false;
on_l_slope = false;
on_r_slope = false;
dash = false;
dash_ending = false;
sliding = false;
bounce = false;
sleeping = false;
dmg_taken = 0;
poisedmg_taken = 0;
hit_direction = 1;
stepped_on = false;

//Msic
shake_direction = 0;
enemy_action_x = 0;
enemy_action_y = -17;
stun_effect = false;
home_x = x;
home_y = y;
image_xscale = -1;

//AI GENERAL FUNCTIONS
ai_pause_time = 0;

//WANDER AI
stopping = false;
walking = false;
wander_destination = 0;
wander_range = 0;
wander_range_min = 32;
wander_range_max = 80;
wander_direction = 1;

enum enemy_state
{
	neutral,
	stunned,
	attacking,
}

my_state = enemy_state.neutral;

enum hurt_properties
{
	normal,
	launchup,
	launchdown,
	launchhorizontal,
	hitbounce,
}
dmg_response = hurt_properties.normal;