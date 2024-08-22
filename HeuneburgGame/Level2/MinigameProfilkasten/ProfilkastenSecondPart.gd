extends Node2D

onready var klopse_arr: Array = get_node("Erdklopse").get_children()
var grabbed_tool : Node = null

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
	
	


func erase_cutout(node):
	klopse_arr.erase(node)
	if klopse_arr.size() == 0:
		print("all cutouts deleted")


func _on_grabbed_tool(node):
	if grabbed_tool != node:
		grabbed_tool = node
		emit_signal("change_tool", node)

