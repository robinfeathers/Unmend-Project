///@desc character_action_set
///@arg character_sprite
///@arg set_hsp
///@arg set_vsp
///@arg action_min_time
///@arg action_max_time
///@arg reset_animation
///@arg gravity_allowed
///@arg disallow_twice?

if argument[0] == noone{}
else play_animation(argument[0])
if argument[0] == s_player_magic_guard {}
else character_magic_guard = false;
image_index = 0;
image_xscale = facing_direction;

//MAKE THESE 0 IF YOU PLAN ON CREATING AN ACTION WITH UNIQUE PLAYER MOVEMENT
hsp = 0;
attack_hsp = argument[1];
vsp = argument[2];

action_min_time = argument[3];
action_max_time = argument[4];
gravity_allowed = argument[6];

if argument[7]{disallowed_action = argument [0];}
else {disallowed_action = noone;}

if argument[5] reset_animation = argument[0];
else resent_animation = noone;
my_action_buffer = action_input_buffer.none;
my_entity_state = entity_state.acting;

