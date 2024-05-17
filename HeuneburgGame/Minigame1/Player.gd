extends Area2D


export var speed = 400.0
export var line_height = 64.0
var screen_size = Vector2.ZERO

func _ready():
	screen_size = get_viewport_rect().size


func _process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	
	if Input.is_action_just_pressed("move_down"):
		direction.y += 1
	if Input.is_action_just_pressed("move_up"):
		direction.y -= 1
	
	if direction.length() > 1:
		direction = direction.normalized();
	
	position.x += direction.x * delta * speed
	position.y += direction.y * line_height
	position.x = clamp(position.x, 32, screen_size.x - 32)
	position.y = clamp(position.y, 32, screen_size.y - 32)
	
