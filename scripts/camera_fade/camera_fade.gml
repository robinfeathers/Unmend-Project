var fadeout = argument[0]
var time = argument[1]
var col = argument[2]

if fadeout {o_game.fading = 1}
else {o_game.fading = -1}
o_game.fadetime = time
o_game.fadecol = col