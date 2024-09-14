extends TextureRect

func _on_Button_toMap3_pressed():
	$CloseDiary.play()
	$VideoZoom.show()
	$VideoZoom.play()


func _on_VideoZoom_finished():
	get_tree().change_scene("res://Level3/Minigame3/MessageBeforeOutro.tscn")
