extends Area2D

var mouse_entered = false


func _on_Werkzeug_mouse_entered():
	mouse_entered = true


func _on_Werkzeug_mouse_exited():
	mouse_entered = false


func _process(_delta):
	if mouse_entered and Input.is_mouse_button_pressed(BUTTON_LEFT):
		position = get_global_mouse_position()


