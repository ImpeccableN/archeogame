extends TextureRect


func get_drag_data(_pos):
	#retrieve information about the slot we are dragging
	var data = {}
	data["origin_texture"] = texture
	
	#makes temporary texture appear and draggable
	var drag_texture = TextureRect.new()
	drag_texture.expand = true
	drag_texture.texture = texture
	drag_texture.rect_size = Vector2(360, 340)
	
	#this code makes the mouse center to the draggable texture
	var control = Control.new()
	control.add_child(drag_texture)
	drag_texture.rect_position = -0.5 * drag_texture.rect_size
	set_drag_preview(control)
	
	#data variable is passed on to the functions below
	return data


func can_drop_data(_pos, data):
	#check if we can drop an item in this slot
	return true
	return false

func drop_data(_pos, data):
	#what happens when we drop an item in this slot
	pass
