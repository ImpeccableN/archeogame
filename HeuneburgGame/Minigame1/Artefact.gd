extends Area2D




func _on_Artefact_body_entered(body):
	var groups_of_colliding_body = body.get_groups()
	for group in groups_of_colliding_body:
		if group == "sun":
			queue_free()
