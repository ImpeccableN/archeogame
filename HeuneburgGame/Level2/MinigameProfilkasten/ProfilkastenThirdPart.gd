extends Node2D

var grabbed_tool : Node = null
export var strength: float
export var speed: float
onready var flash = get_node("CameraFlash")

signal change_tool(node)

func _ready():
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
#	if Input.is_mouse_button_pressed(1):
#		camera_flash()


func _on_grabbed_tool(node):
	if grabbed_tool != node:
		grabbed_tool = node
		emit_signal("change_tool", node)


func camera_flash():
	$AudioCameraFlash.play()
	$Tween.interpolate_property(flash, "self_modulate:a", 0, strength, speed, Tween.TRANS_SINE, Tween.EASE_OUT)
	$Tween.start()
#	$AudioCameraFlash.play()
#	$AudioCameraFlash.stream_paused = true
	
	yield(get_tree().create_timer(0.05), "timeout")
	$Tween.interpolate_property(flash, "self_modulate:a", strength, 0, 1, Tween.TRANS_SINE, Tween.EASE_OUT)
	$Tween.start()
#	$AudioCameraFlash.stream_paused = true
