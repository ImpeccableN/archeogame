extends Label

func _ready():
	if Global.minigame_digger_done:
		set_text("You've already done this. Look for something else.")
