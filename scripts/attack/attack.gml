///@desc Play the animation for the player.
///@arg sprite_index
///@arg set_hsp
///@arg lockout_time
///@arg lockwalk_time
///@arg dmg
///@arg poisedmg

dmg = argument[4];
poisedmg = argument[5];
play_animation(argument[0])
attack_hsp = argument[1];
hsp = 0;
lockout_time = argument[2];
lockwalk_time = argument[3];
image_xscale = intended_direction;

mybuffer = buffer_input.none;
mystate = player_state.acting;

diving = false;
sliding = false;
dash_ending = false;