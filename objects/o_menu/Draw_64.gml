for (var h = 0; h < array_height_2d(spellsmatrix); h += 1)
{
	for (var w = 0; w < array_length_2d(spellsmatrix, h); w += 1)
	{
		var xdisp = 30 + 30 * w
		var ydisp = 30 + 30 * h
		draw_set_color(c_white)
		if assigning > 0 {draw_set_color(c_red)}
		if spells_x == w && spells_y == h {draw_rectangle(xdisp - 2, ydisp - 2, xdisp + 22, ydisp + 22, 1)}
		draw_set_color(c_black)
		if spells[0] > 0 && spells[0] == spellsmatrix[h, w] {draw_set_color(c_red)}
		if spells[1] > 0 && spells[1] == spellsmatrix[h, w] {draw_set_color(c_blue)}
		if spells[2] > 0 && spells[2] == spellsmatrix[h, w] {draw_set_color(c_green)}
		
		if spellsmatrix[h, w] > 0
		{
			draw_rectangle(xdisp, ydisp, xdisp + 20, ydisp + 20, 0)
			draw_set_color(c_white)
			draw_text(xdisp + 5, ydisp + 5, spellsmatrix[h, w])
		}
		else
		{
			draw_set_color(c_gray)
			draw_rectangle(xdisp, ydisp, xdisp + 20, ydisp + 20, 0)
			draw_set_color(c_white)
		}
	}
}