extends Area2D

var member_name : String
var member_path = "res://CharacterScenes/"
var member_scene = preload("res://TeamMember.tscn")


func _on_WerkzeugPerson_mouse_entered():
	$Sprite/InfoBox.show()


func _on_WerkzeugPerson_mouse_exited():
	$Sprite/InfoBox.hide()


func initiate_scene(name):
	member_name = name
	var scene_instance = member_scene.instance()
	add_child(scene_instance)
	scene_instance.initiate(member_name)
	$Sprite.texture = load(scene_instance.member_headshot_path)
