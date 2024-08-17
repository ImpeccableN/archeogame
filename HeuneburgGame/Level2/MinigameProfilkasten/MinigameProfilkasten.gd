extends Node2D

onready var cutout_arr: Array = get_tree().get_nodes_in_group("cutout")

func _ready():
	var tools: Array = get_tree().get_nodes_in_group("tool")
	var tool_pos: Array = $Toolbox.get_children()
	
	
	var i = 0
	for tl in tools:
		tl.position = tool_pos[i].global_position
		tl.set_wait_pos(tool_pos[i].global_position)
		i += 1


func erase_cutout(node):
	cutout_arr.erase(node)
	if cutout_arr.size() == 0:
		print("all cutouts deleted")
