extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


func _on_UsernameInput_text_entered(new_text):
	show()


func _on_ContinueButton_pressed():
	hide()



