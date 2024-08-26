extends VideoPlayer

func _on_Button_nextPage_pressed():
		play()
		$SoundFlip.play()
		$TgStatic/Label_Introtxt1.hide()
		$TgStatic/Label_Introtxt2.hide()
		$TgStatic/Button_nextPage.hide()
		yield(get_tree().create_timer(1.0), "timeout")
		$TgStatic/Button_Start.show()
