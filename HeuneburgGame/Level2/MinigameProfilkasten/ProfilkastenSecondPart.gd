extends Node2D

onready var klopse_arr: Array = get_node("Erdklopse").get_children()
var grabbed_tool : Node = null
var earth_collected : int = 0
var shards_collected : int = 0

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



func _on_EarthHeap_collect_earth():
	earth_collected += 1
	if shards_collected == 3 and earth_collected == 5:
		yield(get_tree().create_timer(2), "timeout")
		get_tree().change_scene("res://Level2/MinigameProfilkasten/ProfilkastenThirdPart.tscn")


func _on_Scherbe_shard_collected():
	shards_collected += 1
	if shards_collected == 3 and earth_collected == 5:
		yield(get_tree().create_timer(2), "timeout")
		get_tree().change_scene("res://Level2/MinigameProfilkasten/ProfilkastenThirdPart.tscn")
