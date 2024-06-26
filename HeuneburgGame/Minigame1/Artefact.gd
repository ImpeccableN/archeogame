extends Area2D

var sprite_path = "res://Minigame1/Assets/Sprites/Artefacts/"

#checks if bodys entering Artefact area belong to group "sun". If so, delete Artefact scene
func _on_Artefact_body_entered(body):
	var groups_of_colliding_body = body.get_groups()
	for group in groups_of_colliding_body:
		if group == "sun":
			queue_free()


func assign_sprite(path):
	$Sprite.texture = load(path)
