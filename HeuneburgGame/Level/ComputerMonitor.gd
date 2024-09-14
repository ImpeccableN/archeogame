extends Node2D


#plays computer booting sound when scene is entered
func _ready():
	$CanvasLayer/Control_Application.hide()
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
	$Diary/BookClose.play()
	$Diary.hide()
	$Diary/Diary_texture.hide()
	$PCMonitor.show()
	$CanvasLayer.show()


func _on_Button_Glossar_pressed():
	$Diary/Diary_texture/Button_Glossar/Label_titel1.show()
	$Diary/Diary_texture/Button_Glossar/term1.show()
	$Diary/Diary_texture/Button_Glossar/explanation1.show()
	$Diary/Diary_texture/Button_Glossar/Button_nextPage1.show()


func _on_Close_explanation_pressed():
	$CanvasLayer/Control_Application.show()
	$Application_intro.hide()
	$Application_intro/Close_explanation.hide()
