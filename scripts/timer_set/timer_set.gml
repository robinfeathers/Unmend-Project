var action = argument[0]
var timer = argument[1]
var args = []
var i = 0
while array_length_1d(args) < argument_count - 2
{
	args[i] = argument[i + 2]
	i += 1
}

o_timer.action = action
o_timer.timer = timer
o_timer.actionargs = args