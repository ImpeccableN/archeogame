extends Node2D



#plays computer booting sound when scene is entered
func _ready():
	$PCBoot.play()


func _on_Button_Tip2_pressed():
	$PCMonitor/Tip2.show()
	yield(get_tree().create_timer(3.0), "timeout")
	$PCMonitor/Tip2.hide()



func _on_Button_Diary_pressed():
	$Diary.show()
	$Diary/Diary_texture.show()
	$PCMonitor.hide()
	$CanvasLayer.hide()
	

func _on_Button_Close_pressed():
	$Diary.hide()
	$Diary/Diary_texture.hide()
	$PCMonitor.show()
	$CanvasLayer.show()
