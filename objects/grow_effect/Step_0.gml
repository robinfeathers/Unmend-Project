if image_alpha <= 0
{
	instance_destroy()
}

if image_xscale < (max_scale * .75)
{

	image_xscale += growth_rate;
	image_yscale += growth_rate;
	image_alpha =+ growth_rate;
}

if (image_xscale >= (max_scale * .75)) and (image_xscale < max_scale)
{

	image_xscale += (growth_rate / 4);
	image_yscale += (growth_rate / 4);
	image_alpha += (growth_rate / 2);
}

if image_xscale >= max_scale
{

	image_xscale = max_scale;
	image_yscale = max_scale;
	image_alpha -= .1;
}

if image_alpha > max_alpha
{
	image_alpha = max_alpha
}


