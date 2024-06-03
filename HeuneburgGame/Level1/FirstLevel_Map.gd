extends Node2D

onready var grabungsstaette_image = get_node("Grabungsstaette_Overlay")
onready var freilichtmuseum_image = get_node("Freilichtmuseum_Overlay")
onready var keltenmuseum_image = get_node("Keltenmuseum_Overlay")
export var grow_speed = 0


func _on_Button_Grabungsstaette_mouse_entered():
	grabungsstaette_image.rect_scale = Vector2(1.2, 1.2)


func _on_Button_Grabungsstaette_mouse_exited():
	grabungsstaette_image.rect_scale = Vector2(1.0, 1.0)


func _on_Button_Freilichtmuseum_mouse_entered():
	freilichtmuseum_image.rect_scale = Vector2(1.2, 1.2)


func _on_Button_Freilichtmuseum_mouse_exited():
	freilichtmuseum_image.rect_scale = Vector2(1.0, 1.0)


func _on_Button_Keltenmuseum_mouse_entered():
	keltenmuseum_image.rect_scale = Vector2(1.2, 1.2)


func _on_Button_Keltenmuseum_mouse_exited():
	keltenmuseum_image.rect_scale = Vector2(1.0, 1.0)
