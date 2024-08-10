extends Area2D

var grabbed : bool = false 
var mouse_entered : bool = false
var wait_pos : Vector2
var entered_areas: Array


func _ready():
	pass
#	var path = ($Sprite.texture.resource_path)
#	var image = Image.new()
#	image.load(ProjectSettings.globalize_path(path))
#
#	var bitmap = BitMap.new()
#	bitmap.create_from_image_alpha(image)
#
#	var polygons = bitmap.opaque_to_polygons(Rect2(Vector2(0, 0), bitmap.get_size()))
#
#	for polygon in polygons:
#		var collider = CollisionPolygon2D.new()
#		collider.polygon = polygon
#		add_child(collider)
#		collider.position = Vector2(0,0)

func set_grabbed():
	grabbed = not grabbed
	if Input.get_mouse_mode() == Input.MOUSE_MODE_HIDDEN:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		raise()

func get_grabbed():
	return grabbed

func show_cursor():
	if Input.get_mouse_mode() == Input.MOUSE_MODE_HIDDEN:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _input(event):
	if mouse_entered and grabbed == false:
		if event.is_pressed() and event.get_button_index() == 1:
			set_grabbed()
#			show_cursor()
	
	if grabbed and event is InputEventMouseMotion:
		position = get_global_mouse_position()
	
	if grabbed:
		if event.is_pressed() and event.get_button_index() == 2:
			go_to_wait()
			set_grabbed()
#			show_cursor()
			

func _on_ProfilkastenTool_mouse_entered():
	mouse_entered = true
	print("mouse entered")


func _on_ProfilkastenTool_mouse_exited():
	mouse_entered = false


func go_to_wait():
	position = wait_pos


func _on_Timer_timeout():
	if $Sprite.rotation_degrees == 0:
		$Sprite.rotation_degrees = 10
	else:
		$Sprite.rotation_degrees = 0


func _on_ProfilkastenTool_area_entered(area):
	entered_areas.append(area)
	if $Timer.get_time_left() == 0:
		$Timer.start()


func _on_ProfilkastenTool_area_exited(area):
	entered_areas.erase(area)
	if entered_areas.size() == 0:
		$Timer.stop()
		$Sprite.rotation_degrees = 0


func set_wait_pos(pos):
	wait_pos = pos
