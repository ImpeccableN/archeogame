extends Area2D

var member_name : String
var member_path = "res://CharacterScenes/"
#first add TeamMember as Node to tree. Then team_mamber_data var equals TeamMember Node
#onready var team_member_data = 

func _ready():
	initiate_scene("Kilian")

func _on_WerkzeugPerson_mouse_entered():
	$Sprite/InfoBox.show()


func _on_WerkzeugPerson_mouse_exited():
	$Sprite/InfoBox.hide()


func initiate_scene(name):
	member_name = name
	var scene_instance = load(member_path + "TeamMember_" + member_name + ".tscn").instance()
	add_child(scene_instance)
	$Sprite.texture = load(scene_instance.member_headshot_path)
