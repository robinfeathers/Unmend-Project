var arr = argument[0]
var yind = argument[1]
for (var xind = 0; xind < argument_count - 2; xind += 1)
{
	arr[yind, xind] = argument[xind + 2]
}
return arr