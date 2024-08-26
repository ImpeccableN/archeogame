extends Node2D


#plays computer booting sound when scene is entered
func _ready():
	$PCBoot.play()


func _on_Button_Tip2_pressed():
	$PCMonitor/Tip2.show()
	yield(get_tree().create_timer(3.0), "timeout")
	$PCMonitor/Tip2.hide()


func _on_Button_Diary_pressed():
	get_tree().change_scene("res://Level/Tg_Lesezeichen.tscn")


