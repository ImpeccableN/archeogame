extends Node2D

var grabbed_tool : Node = null

#keeps track of snapped tools
var snapped_tools: int = 0
export var strength: float
export var speed: float
export var region: Rect2
onready var flash = get_node("CameraFlash")

signal change_tool(node)

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	var tools: Array = get_tree().get_nodes_in_group("tool")
	var tool_pos: Array = $Toolbox.get_children()
	
	
	var i = 0
	for tl in tools:
		tl.connect("grabbed_tool", self, "_on_grabbed_tool")
		connect("change_tool", tl, "ungrab_tool")
		tl.position = tool_pos[i].global_position
		tl.set_wait_pos(tool_pos[i].global_position)
		i += 1


#func _input(event):
#
#


#saves grabbed tool node when a tool is grabbed.
#sends information to profiltool script
func _on_grabbed_tool(node):
	if grabbed_tool != node:
		grabbed_tool = node
		emit_signal("change_tool", node)


func tools_snapped():
	snapped_tools += 1


func camera_flash():
	$Kamera.hide()
	yield(get_tree().create_timer(0.1), "timeout")
	var image = get_viewport().get_texture().get_data().get_rect(region)
	image.flip_y()
	var imgtext = ImageTexture.new()
	imgtext.create_from_image(image)
	Global.photo = imgtext
	
	
	$AudioCameraFlash.play()
	$CameraFlash.raise()
	$Tween.interpolate_property(flash, "self_modulate:a", 0, strength, speed, Tween.TRANS_SINE, Tween.EASE_OUT)
	$Tween.start()
	
	yield(get_tree().create_timer(0.05), "timeout")
	$Tween.interpolate_property(flash, "self_modulate:a", strength, 0, 1, Tween.TRANS_SINE, Tween.EASE_OUT)
	$Tween.start()
	$Kamera.show()
	$Photo.texture = imgtext
	yield(get_tree().create_timer(1), "timeout")
	$Photo.show()
	yield(get_tree().create_timer(3), "timeout")
	$Photo.hide()
	
	if snapped_tools == 3:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().change_scene("res://Level2/SecondDay_Map.tscn")

