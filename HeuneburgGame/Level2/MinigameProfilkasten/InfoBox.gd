extends RichTextLabel



func _on_CloseButton_pressed():
	hide()


func _on_Button_Tip_pressed():
	show()


func new_message():
	text = "\nNow for the Grand Finale!"
	show()
