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
slow_gravity = 0;

max_fallsp = 5.25;
slope_speed_cap = true;

slide_timer = 0;
max_slide_sp = 6.5;

slide_left = false;
slide_right = false;

grabbing_ledge = false;
ledge_x = 0;
ledge_y = 0;

airstep_time_max = 10;
airstep_time = 0;
airstep_step_time_max = 15;
airstep_step_time = 0;
airstep_wall = false;
stepped_target = noone;

dash_allowed = true;

momentum_end_anim = noone;

//Taking Damage Variables
hp = hp_max;
poise = poise_max;
dmg_taken = 0;
poise_dmg_taken = 0;
got_hit = false;
stepped_on = false;
hit_direction = 0;
take_damage_type = "none" //none, physical, magical, true

poise_regain = 0;
stun_delay = 0;
stun_time = 0;

attacker = noone;
damage_angle = 0;
shake = 0;
shake_amount = 0;

invincibility_starting_frame = 0;
invincibility_ending_frame = 0;
invincible_animation = noone;

block_starting_frame = 0;
block_ending_frame = 0;
character_block = noone;
block_attack = false;

airstun_bounce = false;
airstun_time_max = 30;
airstun_time = 0;

character_magic_guard = false;
magic_barrier_object = noone;

enum stunned_state
{
	none,
	launch_up,
	launch_down,
	launch_side,
	bounce
}
character_stunned_state = stunned_state.none;

//Combat Variables
pulse_points = 0;
pulse_points_requirement = 1000;
create_pulse = false;
pulse_o_x = x;
pulse_o_y = y;
pulse_start_frame = 0;

mana_points = 250;
mana_recharging = false;

rise_attack = false;
rise_confirm = false;
rise_vsp = 0;

spell_cast = "none";

disallowed_action = noone;

//TEMPORARY MUST BE MOVED TO A SEPERATE FILE
pulse_obtained = true;

dmg_taken = 0;
poise_dmg_taken = 0;
invincible = false;
sleeping = false;
sleep_time = 0;

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
create_slash_damage_type = "none" //none, physical, magical, true

create_slash = false;
slash_created = false;

bounce = false;
launching_up = false;
launching_down = false;
launching_horizontal = false;

//AI Variables
ai_type_actions=[];
possible_actions=[];
passive_state_allowed = true;

//Animation Variables
reset_animation = noone;
stop_animation_delay = 0;
stop_animation_delay_time = 2.5;
play_stop_animation = false;

walk_animation_delay = 2.5;

disallow_turning = false;

fall_anim_delay = -2;

play_land_animation = false;

shadow_width = bbox_right - bbox_left - 2

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
	stunned,
	dead
}
my_entity_state = entity_state.neutral;

//Special Action States
character_ground_pound = false;
character_slide = false;
character_air_step = false;
character_dash = false;
character_ledge_hold = false;

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

//debug vars
character_debug = true;

