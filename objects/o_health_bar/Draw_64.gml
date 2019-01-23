if instance_exists(owner)
{
	var xpos = 10
	var ypos = 10
	
	var late_delay = 30
	
	var hp = owner.hp
	var hp_max = owner.hp_max
	var hp_max_default = 2000
	var mana = owner.mana_points
	var mana_max = owner.max_mana_points
	var pulse = owner.pulse_points
	var pulse_max = owner.max_pulse_points
	var pulse_req = owner.pulse_points_requirement
	var combo = owner.combo_counter
	var combo_max = 4

	// Draw back bar
	draw_sprite(s_Hud_Back, 0, xpos, ypos)
	
	// Overload health
	var hp_trunc = hp
	if hp > hp_max_default
	{
		hp_trunc = hp - hp_max_default
		draw_sprite(s_Hud_Extra, 1, xpos, ypos)
	}
	
	// Actual health value shown
	if true_health != hp_trunc
	{
		true_health += floor(hp_max_default / 10) * sign(hp_trunc - true_health)
		if abs(hp_trunc - true_health) < floor(hp_max_default / 10) {true_health = hp_trunc}
	}
	
	// Late health
	var healthx = xpos + 31
	var healthy = ypos + 9
	if late_health < true_health {late_health = true_health}
	if old_health != hp
	{
		late_health_delay = late_delay
		old_health = hp
	}
	if late_health != hp
	{
		if late_health_delay > 0 {late_health_delay -= 1}
		else
		{
			late_health += floor(hp_max_default / 10) * sign(hp - late_health)
			if abs(hp - late_health) < floor(hp_max_default / 10) {late_health = hp}
		}
	}
	late_health = clamp(late_health, 0, hp_max_default)
	var late_health_drawn = late_health
	if late_health > hp_trunc && hp > hp_trunc {late_health_drawn = hp_trunc}
	draw_sprite_part(s_Hud_HealthBack, 0, 0, 0, floor(late_health_drawn * (sprite_get_width(s_Hud_HealthBack) / hp_max_default)), sprite_get_height(s_Hud_HealthBack), healthx, healthy)
	
	// Health
	draw_sprite_part(s_Hud_Health, 0, 0, 0, floor(true_health * (sprite_get_width(s_Hud_Health) / hp_max_default)), sprite_get_height(s_Hud_Health), healthx, healthy)

	// Actual mana value shown
	if true_mana != mana
	{
		true_mana += floor(mana_max / 10) * sign(mana - true_mana)
		if abs(mana - true_mana) < floor(mana_max / 10) {true_mana = mana}
	}

	// Late mana
	var manax = xpos + 31
	var manay = ypos + 18
	if late_mana < true_mana {late_mana = true_mana}
	if old_mana != mana
	{
		late_mana_delay = late_delay
		old_mana = mana
	}
	if late_mana != mana
	{
		if late_mana_delay > 0 {late_mana_delay -= 1}
		else
		{
			late_mana += floor(mana_max / 10) * sign(mana - late_mana)
			if abs(mana - late_mana) < floor(mana_max / 10) {late_mana = mana}
		}
	}
	draw_sprite_part(s_Hud_ManaBack, 0, 0, 0, floor(late_mana * (sprite_get_width(s_Hud_ManaBack) / mana_max)), sprite_get_height(s_Hud_ManaBack), manax, manay)

	// Mana
	draw_sprite_part(s_Hud_Mana, 0, 0, 0, floor(true_mana * (sprite_get_width(s_Hud_Mana) / mana_max)), sprite_get_height(s_Hud_Mana), manax, manay)

	// Pulse
	var pulse_trunc = pulse
	if pulse > pulse_req
	{
		pulse_trunc = pulse - pulse_req
		draw_sprite(s_Hud_Extra, 0, xpos, ypos)
	}
	
	var imgind = floor(pulse_trunc / (pulse_req / (sprite_get_number(s_Hud_Pulse)-1)))
	draw_sprite(s_Hud_Pulse, imgind, xpos, ypos)
	
	// Combo
	draw_sprite(s_Hud_Combo, min(combo, combo_max), xpos, ypos)

	// Combo fire
	if combo > 3
	{
		if sprite_index == -1 {sprite_index = s_Hud_ComboFire_Start}
	}
	else
	{
		if sprite_index != -1 {sprite_index = s_Hud_ComboFire_Miss}
	}
	if sprite_index != -1 {draw_sprite(sprite_index, image_index, xpos, ypos)}

	// Caps
	if hp_max <= hp_max_default
	{
		draw_sprite(s_Hud_Caps, 1, xpos, ypos)
	}
	if pulse_max <= pulse_req
	{
		draw_sprite(s_Hud_Caps, 0, xpos, ypos)
	}
}