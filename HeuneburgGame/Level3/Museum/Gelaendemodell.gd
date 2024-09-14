extends Node2D


func _ready():
	$info_text.hide()


func _on_Button_moreInfo_pressed():
	$info_text.show()


func _on_Button_back_pressed():
	get_tree().change_scene("res://Level3/Keltenmuseum.tscn")


func _on_Button_moreInfo2_pressed():
	get_tree().change_scene("res://Level3/Museum/Stadt_moreInfo.tscn")
