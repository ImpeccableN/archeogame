extends Area2D


var disaster_score
var load_num : String



func _ready():
	disaster_score = Global.disaster_score
	
	match_score()
	load_texture()
	print(disaster_score)
	print(load_num)

func match_score():
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


func load_texture():
	$Sprite.texture = load("res://graphics/DisasterScoreBar/DisasterBar" +  load_num + ".png")


func _on_DisasterScore_mouse_entered():
	$Label.show()


func _on_DisasterScore_mouse_exited():
	$Label.hide()
