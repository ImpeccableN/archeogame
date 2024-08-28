extends Area2D

var grabbed : bool = false 
#var mouse_entered : bool = false
var wait_pos : Vector2
var entered_areas: Array
var snap_zone_entered : bool = false
var snap_zone_pos : Vector2
var snapped : bool = false
var camera_flash_buffer : bool = true
onready var main_node = get_parent()


signal grabbed_tool(node)
signal tool_snap

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
#	grabbed = not grabbed
	if not grabbed:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		raise()


func show_cursor():
	if Input.get_mouse_mode() == Input.MOUSE_MODE_HIDDEN:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _input(event):
	if not snapped:
		if grabbed and snap_zone_entered:
			if event.is_pressed() and event.get_button_index() == 1:
				if "massstab" in get_groups():
					global_position.y = 406
					update()
				if not "massstab" in get_groups():
					rotation = 0
				grabbed = false
				snap()
				set_grabbed()
		
		if grabbed and "kamera" in get_groups():
			if Input.is_mouse_button_pressed(1):
				if camera_flash_buffer:
					camera_flash_buffer = not camera_flash_buffer
				else:
					get_parent().camera_flash()
				
		
#	if mouse_entered and grabbed == false:
#		if event.is_pressed() and event.get_button_index() == 1:
#			set_grabbed()
#			show_cursor()
	
		if grabbed and event is InputEventMouseMotion:
			position = get_global_mouse_position()
	
		if grabbed:
			if event.is_pressed() and Input.is_mouse_button_pressed(2):
#				print(main_node.grabbed_tool)
				emit_signal("grabbed_tool", null)
#				print(main_node.grabbed_tool)
				go_to_wait()
				set_grabbed()
#				show_cursor()
			

#func _on_ProfilkastenTool_mouse_entered():
#	mouse_entered = true
#
#
#func _on_ProfilkastenTool_mouse_exited():
#	mouse_entered = false


func go_to_wait():
	position = wait_pos


func _on_Timer_timeout():
	if $Sprite.rotation_degrees == 0:
		$Sprite.rotation_degrees = 10
	else:
		$Sprite.rotation_degrees = 0


func _on_ProfilkastenTool_area_entered(area):
	if "snap_zone" in area.get_groups() or "tool" in area.get_groups():
		pass
	else:
		entered_areas.append(area)
		if $Timer.get_time_left() == 0:
			$Timer.start()


func _on_ProfilkastenTool_area_exited(area):
	if "snap_zone" in area.get_groups():
		pass
	else:
		entered_areas.erase(area)
		if entered_areas.size() == 0:
			$Timer.stop()
			$Sprite.rotation_degrees = 0


func set_wait_pos(pos):
	wait_pos = pos


func _on_ToolButton_button_down():
	if not snapped:
		set_grabbed()
		emit_signal("grabbed_tool", self)


func ungrab_tool(node):
	if not snapped:
		if node == self:
			grabbed = true
			set_grabbed()
		else:
			grabbed = false
			go_to_wait()
			camera_flash_buffer = true


func disable_collision():
	$CollisionShape2D.set_deferred("disabled", true)


func enable_collision():
	$CollisionShape2D.set_disabled(false)


func snapzone_entered(pos):
	snap_zone_entered = true
	snap_zone_pos = pos


func snapzone_exited():
	snap_zone_entered = false


func snap():
	snapped = true
	emit_signal("tool_snap")
	
