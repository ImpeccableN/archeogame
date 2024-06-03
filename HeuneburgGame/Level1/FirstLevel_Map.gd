extends Node2D

onready var grabungsstaette_image = get_node("Grabungsstaette_Overlay")
export var grow_speed = 0

func _on_Button_button_up():
	print("click")


func _on_Button_Grabungsstaette_mouse_entered():
	grabungsstaette_image.rect_scale = Vector2(1.2, 1.2)



func _on_Button_Grabungsstaette_mouse_exited():
	grabungsstaette_image.rect_scale = Vector2(1.0, 1.0)
