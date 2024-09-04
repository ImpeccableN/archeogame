extends Node2D

var grabbed_tool : Node = null

#keeps track of snapped tools
var snapped_tools: int = 0

var tools: Array
var tool_pos: Array

var camera_flashed = false

export var strength: float
export var speed: float
export var region: Rect2
onready var flash = get_node("CameraFlash")
onready var camera = get_node("ViewportContainer/ViewportPhoto/Kamera")
onready var flashaudio = get_node("ViewportContainer/ViewportPhoto/AudioCameraFlash")
onready var tween = get_node("ViewportContainer/ViewportPhoto/Tween")
onready var photo = get_node("ViewportContainer/ViewportPhoto/Photo")
onready var viewport = get_node("ViewportContainer/ViewportPhoto")
var spitzhacke = preload("res://Level2/MinigameProfilkasten/Spitzhacke.tscn")

signal change_tool(node)

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	tools = get_tree().get_nodes_in_group("tool")
	tool_pos = $ViewportContainer/ViewportPhoto/Toolbox.get_children()
	
	
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
	if camera_flashed == false and snapped_tools == 3:
		camera_flashed = true
		camera.hide()
		yield(get_tree().create_timer(0.1), "timeout")
		var image = viewport.get_texture().get_data().get_rect(region)
		image.flip_y()
		var imgtext = ImageTexture.new()
		imgtext.create_from_image(image)
		Global.photo = imgtext
		
		
		flashaudio.play()
		flash.raise()
		tween.interpolate_property(flash, "self_modulate:a", 0, strength, speed, Tween.TRANS_SINE, Tween.EASE_OUT)
		tween.start()
		
		yield(get_tree().create_timer(0.05), "timeout")
		tween.interpolate_property(flash, "self_modulate:a", strength, 0, 1, Tween.TRANS_SINE, Tween.EASE_OUT)
		tween.start()
		camera.show()
		photo.texture = imgtext
		yield(get_tree().create_timer(1), "timeout")
		photo.show()
		yield(get_tree().create_timer(2), "timeout")
		photo.hide()
		
		transition_to_shovel()
#		Global.profilkasten_done = true
#		$LeaveButton.show()
#		_on_grabbed_tool(null)
#		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
#		$SuccessLabel.show()
	else:
		pass


func transition_to_shovel():
	for thing in tools:
		thing.queue_free()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	var spitzhacken_node = spitzhacke.instance()
	add_child(spitzhacken_node)
	spitzhacken_node.position = tool_pos[0].global_position
	spitzhacken_node.set_wait_pos(tool_pos[0].global_position)
	spitzhacken_node.scale = Vector2(0.075, 0.075)
	$ViewportContainer/ViewportPhoto/Toolbox/ToolButton.connect("pressed", spitzhacken_node, "_on_ToolButton_button_down")
	spitzhacken_node.connect("grabbed_tool", self, "_on_grabbed_tool")
	connect("change_tool", spitzhacken_node, "ungrab_tool")


func _on_LeaveButton_pressed():
	get_tree().change_scene("res://Level2/SecondDay_Map.tscn")
