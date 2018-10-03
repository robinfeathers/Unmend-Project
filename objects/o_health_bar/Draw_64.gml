draw_sprite(pulse_meter_blank,0,0,4);
draw_sprite(pulse_meter_left_02,0,0,4);
var red_bar_size = o_player.hp / 10;

//Draw top hp bar
draw_sprite_stretched(hp_bar_blank_fill,0,46,15,100,6)
draw_sprite(hp_bar_cap,0,146,15)

if o_player.hp >= 1000
{
draw_sprite_stretched(hp_bar_red_fill,0,46,15,100,6)	
}
else draw_sprite_stretched(hp_bar_red_fill,0,46,15,red_bar_size,6)

//draw top hp decoration
if o_player.hp > 0
{
	draw_sprite(hp_top_full,0,19,2)
}
else draw_sprite(hp_top_blank,0,19,2)


var second_hpbar_exists = false;
if o_player.maxhp > 1000
{
	second_red_bar_exists = true;
	
	//draw bottom hp bar
	var blank_bar_length;
	var bottom_red_bar_size = (o_player.hp - 1000) / 10;
	blank_bar_length = (o_player.maxhp - 1000) / 10;
	
	draw_sprite_stretched(hp_bar_blank_fill,0,46,26,blank_bar_length,6)
	draw_sprite(hp_bar_cap,0,46+blank_bar_length,26)
	
	draw_sprite_stretched(hp_bar_red_fill,0,46,26,bottom_red_bar_size,6)
	
	//draw bottom hp decoration
	if o_player.hp >= 1000
	{
		draw_sprite(hp_bottom_full,0,19,25)
	}
	else draw_sprite(hp_bottom_blank,0,19,25)
}

//Draw Pulse Meter






