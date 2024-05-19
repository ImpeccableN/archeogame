extends Area2D

export var speed = 200.0
onready var screen_size = get_viewport_rect().size

var direction := Vector2(1.0, 0.75)


func _process(delta):
	position += direction * delta * speed
	if position.y > screen_size.y:
		direction.y = -0.75
	if position.y < 0:
		direction.y = 0.75
	if position.x > screen_size.x:
		direction.x = -1.0
	if position.x < 0:
		direction.x = 1.0

