extends TextureRect

onready var vid_player = get_node("TgFlip")


func _on_Button_toMap3_pressed():
	get_tree().change_scene("res://Minigame3/MessageBeforeOutro.tscn")


func _on_nextPage_Button_pressed():
	$TitelLabel.hide()
	$DiaryEntry1.hide()
	vid_player.show()
	vid_player.play()
	$TgFlip/SoundFlip.play()


func _on_TgFlip_finished():
	$nextPage_Button.hide()
	$TgFlip.hide()
	$DiaryEntry2.show()
	$Button_toMap3.show()
