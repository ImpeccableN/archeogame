extends KinematicBody2D

export var speed = 200.0
export var starting_position = Vector2.ZERO
export var direction := Vector2.ZERO
var start_speed = 0
var screen_size = Vector2(1024, 576)


signal direction_change


func _process(delta):
	position += direction * delta * speed * start_speed
	if position.y > screen_size.y:
		direction.y *= -1
		emit_signal("direction_change")
	if position.y < 0:
		direction.y *= -1
		emit_signal("direction_change")
	if position.x > screen_size.x:
		direction.x *= -1.0
		emit_signal("direction_change")
	if position.x < 0:
		direction.x *= -1.0
		emit_signal("direction_change")



func _on_Timer_timeout():
	start_speed = 1

func start():
	position = starting_position
	$CollisionShape2D.disabled = false
	start_speed = 0
	$Timer.start()
	
