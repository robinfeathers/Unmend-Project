spells = [0, 0, 0]
spells_owned = [1, 2, 5, 6, 7, 8, 3]

spells_x = 0
spells_y = 0

assigning = 0

spellsmatrix[0, 0] = 0
var matrixwidth = 5
var matrixheight = 5
var listind = 0
var h = 0
var w = 0
while listind < array_length_1d(spells_owned)
{
	spellsmatrix[h, w] = spells_owned[listind]
	listind += 1
	w += 1
	if w >= matrixwidth
	{
		w = 0
		h += 1
	}
}
for (h = 0; h < matrixheight; h += 1)
{
	for (w = array_length_2d(spellsmatrix, h); w < matrixwidth; w += 1)
	{
		spellsmatrix[h, w] = 0
	}
}

my_entity_state = entity_state.none
action_min_time = 0