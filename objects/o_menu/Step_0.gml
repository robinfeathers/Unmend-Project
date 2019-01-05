var xmax = array_length_2d(spellsmatrix, spells_y) - 1
var ymax = array_height_2d(spellsmatrix) - 1

if assigning == 1 {assigning = 2}

get_player_input()
if assigning == 0 && key_jump {assigning = 1}
if key_specialattack || key_grab {assigning = 0}

if assigning == 2
{
	var modify = -1
	if key_up {modify = 0}
	else if key_down {modify = 1}
	else if key_left || key_right {modify = 2}

	if modify != -1
	{
		spells[modify] = spellsmatrix[spells_y, spells_x]
		for (var ind = 0; ind < array_length_1d(spells); ind += 1)
		{
			if ind != modify {if spells[ind] == spells[modify] {spells[ind] = 0}}
		}
		assigning = 0
	}
}
else if assigning == 0
{
	if keyboard_check_pressed(vk_left)
	{
		do
		{
			spells_x = menu_rotate(spells_x, xmax, -1)
		}
		until spellsmatrix[spells_y, spells_x] != 0
	}
	else if keyboard_check_pressed(vk_right)
	{
		do
		{
			spells_x = menu_rotate(spells_x, xmax, 1)
		}
		until spellsmatrix[spells_y, spells_x] != 0
	}
	else if keyboard_check_pressed(vk_up)
	{
		do
		{
			spells_y = menu_rotate(spells_y, ymax, -1)
		}
		until spellsmatrix[spells_y, spells_x] != 0
	}
	else if keyboard_check_pressed(vk_down)
	{
		do
		{
			spells_y = menu_rotate(spells_y, ymax, 1)
		}
		until spellsmatrix[spells_y, spells_x] != 0
	}
}