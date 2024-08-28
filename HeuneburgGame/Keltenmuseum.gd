extends Node2D


func _on_Button_Horsemask_pressed():
	get_tree().change_scene("res://Minigame3/TextureRect_Horsemask.tscn")


func _on_Button_Horseman_pressed():
	get_tree().change_scene("res://Minigame3/TextureRect_Horseman.tscn")


func _on_Button_Leave_pressed():
	get_tree().change_scene("res://Minigame3/ThirdDay_Map.tscn")
