extends Area2D

export var snap_group : String

signal snapzone_entered(pos)
signal snapzone_exited

func _ready():
	var tool_arr = get_tree().get_nodes_in_group("tool")
	
	for tools in tool_arr:
		if snap_group in tools.get_groups():
			connect("snapzone_entered", tools, "snapzone_entered")
			connect("snapzone_exited", tools, "snapzone_exited")

func _on_SnappingZone_area_entered(area):
	if snap_group in area.get_groups():
		emit_signal("snapzone_entered", global_position)


func _on_SnappingZone_area_exited(area):
	if snap_group in area.get_groups():
		emit_signal("snapzone_exited")
