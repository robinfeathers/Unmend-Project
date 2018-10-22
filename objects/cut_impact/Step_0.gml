image_alpha -= get_delta_time()*.15;
if image_alpha <= 0 instance_destroy();
