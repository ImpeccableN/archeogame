extends Area2D


export var speed = 400.0
export var lineHeight = 50


func _process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		direction.x += 1 * speed
	if Input.is_action_pressed("move_left"):
		direction.x -= 1 * speed
	
	if Input.is_action_pressed("move_down"):
		direction.y += lineHeight
