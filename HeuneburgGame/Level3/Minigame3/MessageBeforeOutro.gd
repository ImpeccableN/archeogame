extends TextureRect



func _on_LeaveButton1_pressed():
	$OutroPlayer.show()
	$OutroPlayer.play()
	$MessageLabel1.hide()
	$LeaveButton1.hide()
	$MessageLabel2.show()
	$LeaveButton2.show()


func _on_OutroPlayer_finished():
	$OutroPlayer.hide()


func _on_LeaveButton2_pressed():
	get_tree().change_scene("res://Level3/Minigame3/ThirdDay_Map.tscn")
