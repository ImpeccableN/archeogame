extends Node2D

onready var cutout_arr: Array = get_tree().get_nodes_in_group("cutout")
var grabbed_tool : Node = null

signal change_tool(node)

func _ready():
	MusicPlayer.play_profilkasten()
	
	var tools: Array = get_tree().get_nodes_in_group("tool")
	var tool_pos: Array = $Toolbox.get_children()
	
	
	var i = 0
	for tl in tools:
		tl.connect("grabbed_tool", self, "_on_grabbed_tool")
		connect("change_tool", tl, "ungrab_tool")
		tl.position = tool_pos[i].global_position
		tl.set_wait_pos(tool_pos[i].global_position)
		i += 1


func erase_cutout(node):
	cutout_arr.erase(node)
	if cutout_arr.size() == 0:
		print("all cutouts deleted")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().change_scene("res://Level2/MinigameProfilkasten/ProfilkastenSecondPart.tscn")


func _on_grabbed_tool(node):
	if grabbed_tool != node:
		grabbed_tool = node
		emit_signal("change_tool", node)


