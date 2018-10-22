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

if o_player.pulse_obtained
{	
	shader_set(pulse_meter);
	
	var baseUVs = texture_get_uvs(uni_base_texture);
	var alphaUVs = texture_get_uvs(uni_alpha_texture);
	
	texture_set_stage(uni_base_texture, base_t);
	texture_set_stage(uni_alpha_texture, alpha_t);
	
	shader_set_uniform_f(shader_get_uniform(pulse_meter, "baseUVs"), baseUVs[0], baseUVs[1], baseUVs[2] - baseUVs[0], baseUVs[3] - baseUVs[1]);
	shader_set_uniform_f(shader_get_uniform(pulse_meter, "alphaUVs"), alphaUVs[0], alphaUVs[1], alphaUVs[2] - alphaUVs[0], alphaUVs[3] - alphaUVs[1]);
	
	var pulse_current = o_player.pulse_points / o_player.pulse_points_requirement
	shader_set_uniform_f(uni_percent, pulse_current);
	
	draw_sprite(pulse_meter_ring, 0, 20, 24);
	shader_reset();
	
	
	
	//var pulse_ring = draw_sprite(s_spiral_gradient,0,20,24);
	
}

//draw_sprite(pulse_meter_circle,0,20,24);






