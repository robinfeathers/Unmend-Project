//SWAP EM OUT
if character_ground_pound
and my_entity_state == entity_state.neutral

and character_debug == true
{show_debug_message("I've broken"); character_debug = false;}
else character_debug = false;;