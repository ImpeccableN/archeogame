extends Area2D


var current_score
var old_score
var load_num : String



func _ready():
	current_score = Global.disaster_score
	old_score = Global.old_score
	match_score(old_score)
	load_texture()
	if old_score != current_score:
		animate()

func match_score(disaster_score):
	if disaster_score <= 0:
		load_num = "0"
	if disaster_score > 0 && disaster_score <= 14:
		load_num = "1"
	elif disaster_score > 14 && disaster_score <= 28:
		load_num = "2"
	elif disaster_score > 28 && disaster_score <= 42:
		load_num = "3"
	elif disaster_score > 42 && disaster_score <= 56:
		load_num = "4"
	elif disaster_score > 56 && disaster_score <= 61:
		load_num = "5"
	elif disaster_score > 62 && disaster_score <= 76:
		load_num = "6"
	elif disaster_score > 76 && disaster_score <= 99:
		load_num = "7"
	elif disaster_score >= 100:
		load_num = "8"


func animate():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	yield(get_tree().create_timer(1), "timeout")
	scale *= 1.2
	match_score(current_score)
	yield(get_tree().create_timer(1), "timeout")
	load_texture()
	yield(get_tree().create_timer(1), "timeout")
	scale = Vector2.ONE
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func load_texture():
	$Sprite.texture = load("res://graphics/DisasterScoreBar/DisasterBar" +  load_num + ".png")


func _on_DisasterScore_mouse_entered():
	$Label.show()


func _on_DisasterScore_mouse_exited():
	$Label.hide()
