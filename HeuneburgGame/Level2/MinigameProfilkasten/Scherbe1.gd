extends Area2D

var mouse_entered : bool = false
var shard_deleted : bool = false

signal shard_collected


func _on_Scherbe1_mouse_entered():
	mouse_entered = true
	print("mouse_entered")


func _on_Scherbe1_mouse_exited():
	mouse_entered = false

func _input(_event):
	if mouse_entered and Input.is_mouse_button_pressed(1):
		if shard_deleted:
			emit_signal("shard_collected")
			queue_free()


func _on_Erdklops_deleted(_node):
	shard_deleted = true


func disable_collision():
	$CollisionShape2D.set_deferred("disabled", true)


func enable_collision():
	$CollisionShape2D.set_disabled(false)
