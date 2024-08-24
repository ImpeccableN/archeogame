extends Area2D

var glove_entered : bool = false
var klops_deleted : bool = false

signal shard_collected

func _ready():
	disable_collision()


func _input(_event):
	if glove_entered and Input.is_mouse_button_pressed(1):
		if klops_deleted:
			emit_signal("shard_collected")
			queue_free()


func _on_Erdklops_deleted(_node):
	klops_deleted = true
	enable_collision()


func disable_collision():
	$CollisionShape2D.set_deferred("disabled", true)


func enable_collision():
	$CollisionShape2D.set_disabled(false)


func _on_Scherbe_area_entered(area):
	if "handschuh" in area.get_groups():
		glove_entered = true
		print("glove entered")


func _on_Scherbe_area_exited(area):
	if "handschuh" in area.get_groups():
		glove_entered = false
