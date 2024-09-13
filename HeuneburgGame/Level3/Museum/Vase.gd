extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$info_text.hide()


func _on_Button_moreInfo_pressed():
	$info_text.show()


func _on_Button_back_pressed():
	get_tree().change_scene("res://Level3/Keltenmuseum.tscn")
