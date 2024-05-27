extends KinematicBody2D

export var speed = 200.0
export var starting_position = Vector2.ZERO
onready var screen_size = get_viewport_rect().size

var direction := Vector2.ZERO
signal direction_change


func _process(delta):
	position += direction * delta * speed
	if position.y > screen_size.y:
		direction.y = -0.75
		emit_signal("direction_change")
	if position.y < 0:
		direction.y = 0.75
		emit_signal("direction_change")
	if position.x > screen_size.x:
		direction.x = -1.0
		emit_signal("direction_change")
	if position.x < 0:
		direction.x = 1.0
		emit_signal("direction_change")



func _on_Timer_timeout():
	direction = Vector2(1.0, 0.8)

func start():
	position = starting_position
	$CollisionShape2D.disabled = false
	$Timer.start()
