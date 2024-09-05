extends Area2D

var spitzi_entered = false
onready var dust_video = get_node("../DustVideoPlayer")
onready var main_node = get_tree().get_root().get_child(1)



func _input(event):
	if spitzi_entered and Input.is_mouse_button_pressed(1):
		$CollisionPolygon2D.set_deferred("disabled", true)
		dust_video.show()
		dust_video.play()
		


func _on_SpitzhackeHitPoint_area_entered(area):
	spitzi_entered = true


func _on_SpitzhackeHitPoint_area_exited(area):
	spitzi_entered = false


func _on_DustVideoPlayer_finished():
	main_node.end()
