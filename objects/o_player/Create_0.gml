/// @description Establish states and variables.
//Initial image/animation preferences
mask_index = s_player_idle
image_speed = 1;

//PLAYER GAME STAT VARS
hp = 1250;
maxhp = 1750;
starting_maxhp = 1000;
invincible = false;
pulse_points = 0;
max_pulse_points = 50;
pulse_points_requirement = 50;
pulse_ready = false;

//WALKING VARS
hsp = 0;
max_hsp = 3.3;
max_airhsp = 3.2;
max_slopesp = 3.2;
walksp = .4;
stopsp = .3;

//JUMPING/GRAVITY VARS
vsp = 0;
jumpheight = -9.6;
max_fallsp = 7;
jump_buffer_max = 5;
jump_buffer = jump_buffer_max;
land_buffer = false;

fallanim_delay = -2;

//DIVING VARS
diving = false;
run_dive_script = false;

//SLIDING VARS
max_slidesp = 7;
starting_slidesp = 5;
slidesp= 0;
slide_stop = .1;
slide_decay_timemax = 4;
slide_decay_time = 0;

slide_stopping = false;
sliding = false;
slide_direction = 0;
on_r_slope = false;
on_l_slope = false;

//TAKING DAMAGE VARS
dmg = 0;
poisedmg = 0;

//ATTACKING VARS
slashcreated = false;
combo_counter = 0;
air_spin_attacking = false;
spin_attacking = false;
lockout_time = 0;
lockwalk_time = 0;
attack_hsp = 0;

//DASH VARS
max_dashsp = 8.5;
dashsp = 0;

dash = false;
dash_ending = false;
dash_allowed = true;

//BACKSTEP VARS
max_backstepsp = 7;
backstepsp = 0;

backstep = false;

//STINGER VARS
stingersp = 5;

stinger = false;

//DIVE CUT VARS
dive_cutting = false;

//LEDGE CLIMB VARS
holding_ledge = false;
edge_x = 0;
edge_y = 0;

//AIRSTEP VARS
air_stepping = false;
airstep_holding = false;
airstep_input_timer_max = 15;
airstep_input_timer = 0;
airstep_lock_max = 10;
airstep_lock = 0;
airstep_enemy = noone;
airstep_with_wall = false;
stepped_enemy = noone;
stepped_wall = false;
//edge_x also used
//edge_y also used

//VFX vars and timers
slide_dust_timer = 0;


//MISC
walkanim_delay = 2.5;
my_direction = 0;
airborn = false;
intended_direction = 1;
bounce = false;

controller = false;

//Set basic states for code
enum player_state
{
	neutral,
	acting,
	dead,
}
mystate = player_state.neutral;

//Remember actions the player attempted to perform when they were unable to and store that to use as soon as they are able.
enum buffer_input
{
	none,
	light_hit,
	special_hit,
	backstep,
	dash,
	jump,
	dive,
}
mybuffer = buffer_input.none;

//Hold onto previous action to prevent spamming particular moves
enum stop_attack
{
	none,
	launch,
	backstep,
	stinger,
}
delay_input = stop_attack.none;

//Create any objects that the player specifically needs to create
instance_create_depth(x,y,"Mid_Game_UI",o_health_bar);



//Testing Variables
test = 0;




