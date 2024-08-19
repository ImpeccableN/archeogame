extends Area2D

export var snap_group : String

signal snapzone_entered(pos)

func snap():
	pass

func _on_SnappingZone_area_entered(area):
	if snap_group in area.get_groups():
		emit_signal("snapzone_entered", global_position)
