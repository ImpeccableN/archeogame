extends TextureRect

func delete_self(area):
	if "schaufel" in area.get_groups():
		queue_free()
