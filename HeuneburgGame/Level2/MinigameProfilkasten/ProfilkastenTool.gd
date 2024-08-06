extends Area2D

var grabbed : bool = false 
var mouse_entered : bool = false

func set_grabbed():
	grabbed = not grabbed

func get_grabbed():
	return grabbed

func show_cursor():
	if Input.get_mouse_mode() == Input.MOUSE_MODE_HIDDEN:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _input(event):
	if mouse_entered:
		if event.is_pressed() and event.get_button_index() == 1:
			set_grabbed()
			show_cursor()
	
	if grabbed and event is InputEventMouse:
		position = get_global_mouse_position()

func _on_ProfilkastenTool_mouse_entered():
	mouse_entered = true


func _on_ProfilkastenTool_mouse_exited():
	mouse_entered = false


func _on_ProfilkastenTool_area_entered(area):
	$Timer.start()
	


func _on_Timer_timeout():
	if $Sprite.rotation_degrees == 0:
		$Sprite.rotation_degrees = 10
	else:
		$Sprite.rotation_degrees = 0


func _on_ProfilkastenTool_area_exited(area):
	$Timer.stop()
	$Sprite.rotation_degrees = 0
