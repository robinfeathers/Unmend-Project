/// @description Insert description here

image_speed = 1;

//Input Information Variables
input_direction = 0;
facing_direction = 1;
jump_buffered = false;

//Movement Variables
hsp = 0;
vsp = 0;

stop_sp = 0.3;

attack_hsp = 0;

gravity_allowed = true;
fall_sp = 0;
max_fallsp = 5.25;
slope_speed_cap = true;

slide_sp = 0;

//Taking Damage Variables
hp = 1000;
hp_max = 2000;
got_hit = false;
shake = 0;
dmg_taken = 0;
poise_dmg_taken = 0;

enum cc
{
	none,
	launch_up,
	launch_down,
	launch_side,
	bounce,
}
launch_property = cc.none;

//Combat Variables
pulse_points = 250;
pulse_points_requirement = 1000;
pulse_points_max = 2000
create_pulse = false;
pulse_o_x = x;
pulse_o_y = y;
pulse_start_frame = 0;
mana_points = 0;

//TEMPORARY MUST BE MOVED TO A SEPERATE FILE
pulse_obtained = true;

dmg_taken = 0;
poise_dmg_taken = 0;
invincible = false;

combo_counter = 0;
action_min_time = 0;
action_max_time = 0;
action_await = false; //Is set on an individual basis

enum create_slash_p
{
	none,
	l_up,
	l_down,
	l_side,
	bounce
}
create_slash_attack_properties = create_slash_p.none;

create_slash_sprite = 0;
create_slash_starting_frame = 0;
create_slash_follow_character = true;
create_slash_dmg = 0;
create_slash_poise_dmg = 0;
create_slash_hit_count = 0;
create_slash_hit_delay = 0;
create_slash_continuous_action = false;
create_slash_start_action = 0;
create_slash_special_case = false;

create_slash = false;
slash_created = false;

bounce = false;
launching_up = false;
launching_down = false;
launching_horizontal = false;

//Special Action Variables
air_stepping = false;
air_step_wall = false;
air_step_wall_id = noone;
air_step_entity = false;
air_step_entity_id = noone;
airstep_holding = false;
airstep_input_timer_max = 15;
airstep_input_timer = 0;
airstep_lock_max = 10;
airstep_lock = 0;

sliding = false;
slide_stopping = false;

//Animation Variables
reset_animation = noone;
stop_animation_delay = 0;
stop_animation_delay_time = 2.5;
play_stop_animation = false;

walk_animation_delay = 2.5;

disallow_turning = false;

fall_anim_delay = -2;

play_land_animation = false;

shadow_width = bbox_right - bbox_left

//Lists

//Faction
enum alliance_group
{
	none,
	player,
	enemy,
	ally
}
character_alliance = alliance_group.none

if Player_Object character_alliance = alliance_group.player
else if Enemy_Object character_alliance = alliance_group.enemy
else if Ally_Object character_alliance = alliance_group.ally

//States
enum entity_state
{
	none,
	neutral,
	acting,
	dead
}
my_entity_state = entity_state.neutral;

//Abilities Allowed
enum ability_allowed
{
	none
}

enum generic_actions
{
	idle,
	run,
	jump
}

current_generic_action = generic_actions.idle;
previous_generic_action = current_generic_action;

enum action_input_buffer
{
	none,
	n_attack,
	s_attack,
	grab,
	jump,
	dodge
}

my_action_buffer = action_input_buffer.none;

enum direction_input_buffer
{
	neutral,
	up,
	down
}
my_direction_buffer = direction_input_buffer.neutral;
saved_direction_buffer = direction_input_buffer.neutral;


enum l_property
{
	none,
	launch_up,
	launch_down,
	launch_side,
	bounce
}
launch_property = l_property.none

//establishing functions
play_animation(idle_animation_01);

