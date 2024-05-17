extends Area2D

export var speed = 400.0
var straight = true
var screen_size = Vector2.ZERO

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var direction = Vector2.ZERO
	
	if straight:
		direction.x += 1
	else:
		direction.x -= 1
	
	position.x += direction.x * speed * delta
	
	if position.x > screen_size.x:
		straight = not straight
		position.y += 64
	
	if position.x < 0:
		straight = not straight
		position.y += 64
