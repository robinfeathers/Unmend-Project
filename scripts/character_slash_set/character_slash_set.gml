///@desc character_slash_create
///@arg slash_sprite
///@arg starting_frame
///@arg attack_properties /*none, l_up, l_down, l_side, bounce, MISSING
///@arg follows_character
///@arg dmg_dealt
///@arg poise_dmg_dealt
///@arg hit_count
///@arg hit_delay MAKE 0 IF HIT_COUNT IS 1
///@arg continous_action does this go on forever
///@arg start_damage_frame when the slash start's dealing damage
///@arg special_case
///@arg damage_type

create_slash_sprite = argument[0];
create_slash_starting_frame = argument[1];
create_slash_attack_properties = argument[2];
create_slash_follow_character = argument[3];
create_slash_dmg = argument[4];
create_slash_poise_dmg = argument[5];
create_slash_hit_count = argument[6];
create_slash_hit_delay = argument[7];
create_slash_continuous_action = argument[8];
create_slash_start_action = argument[9];
create_slash_damage_type = argument[11];

if !argument[10] create_slash = true;
else create_slash_special_case = true;

rise_attack = false;