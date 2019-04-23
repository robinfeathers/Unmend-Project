if timer > -1
{
	timer -= 1
	if timer == 0
	{
		switch action
		{
			case "room":
				room_goto(actionargs[0])
				break
		}
		timer = -1
		action = ""
	}
}