extends Button

func _ready():
	hide()

func _on_Button_Start_pressed():
	$"../../../Tb_zoomIn".show()
	$"../../../Tb_zoomIn".play()

func _on_Tb_zoomIn_finished():
	get_tree().change_scene("res://Level/Desk.tscn")
