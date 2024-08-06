extends LineEdit


func _on_ContinueButton_pressed():
	hide()

func _on_UsernameInput_text_changed(new_text):
	$"../../../../VBoxContainer_answerfield/ContinueButton".show()
