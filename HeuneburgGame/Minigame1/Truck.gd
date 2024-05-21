extends Area2D

export var speed = 800.0
var straight = true
var screen_size = Vector2.ZERO
onready var sprite_node = get_node("Sprite")
var screen_lowerend = false

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var direction = Vector2.ZERO
	
	if screen_lowerend:
		direction = Vector2(0.0, -1.0)
	else:
		if straight:
			direction.x += 1
			sprite_node.flip_h = true
		else:
			direction.x -= 1
			sprite_node.flip_h = false
	
	position += direction * speed * delta
	
	if screen_lowerend == false && position.x >= screen_size.x:
		straight = not straight
		position.y += 64
	
	if screen_lowerend == false && position.x <= 0:
		straight = not straight
		position.y += 64
	
	if position.y >= screen_size.y:
		screen_lowerend = true
	
	if position.y <= 0:
		screen_lowerend = false
