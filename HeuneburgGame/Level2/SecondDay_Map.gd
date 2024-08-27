extends Node2D

onready var grabungsstaette_image = get_node("Grabungsstaette_Overlay")
onready var freilichtmuseum_image = get_node("Freilichtmuseum_Overlay")
onready var keltenmuseum_image = get_node("Keltenmuseum_Overlay")
onready var bauwagen_image = get_node("Bauwagen_Overlay")
export var images_grow_scale := Vector2.ZERO


#func _ready():
#	# on load up, check if both minigames are absolved succesfully. Wait two seconds, then load diary entry from Day 1.
#	if Global.minigame_digger_done and Global.minigame_werkzeuge_done:
#		yield(get_tree().create_timer(2.0), "timeout")
#		get_tree().change_scene("res://Level1/DiaryLvl1End.tscn")


func _on_Button_Grabungsstaette_mouse_entered():
	grabungsstaette_image.rect_scale = images_grow_scale


func _on_Button_Grabungsstaette_mouse_exited():
	grabungsstaette_image.rect_scale = Vector2.ONE


func _on_Button_Freilichtmuseum_mouse_entered():
	freilichtmuseum_image.rect_scale = images_grow_scale
	$Freilichtmuseum_Overlay/FreilichtLabel.show()


func _on_Button_Freilichtmuseum_mouse_exited():
	freilichtmuseum_image.rect_scale = Vector2.ONE
	$Freilichtmuseum_Overlay/FreilichtLabel.hide()


func _on_Button_Keltenmuseum_mouse_entered():
	keltenmuseum_image.rect_scale = images_grow_scale
	$Keltenmuseum_Overlay/KeltenLabel.show()


func _on_Button_Keltenmuseum_mouse_exited():
	keltenmuseum_image.rect_scale = Vector2.ONE
	$Keltenmuseum_Overlay/KeltenLabel.hide()


func _on_Freilichtmuseum_Overlay_mouse_entered():
	pass # Replace with function body.
