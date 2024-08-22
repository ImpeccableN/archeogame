extends TextureRect

onready var puzzleScore = Global.puzzlePieces

func get_drag_data(_pos):
	#Retrieve information about the slot we are dragging
	var data = {}
	data["origin_texture"] = texture
	
	
	var drag_texture = TextureRect.new()
	drag_texture.expand = true
	drag_texture.texture = texture
	drag_texture.rect_size = Vector2(100, 100)
	
	var control = Control.new()
	control.add_child(drag_texture)
	drag_texture.rect_position = -0.5 * drag_texture.rect_size
	set_drag_preview(control)
	
	return data


func can_drop_data(_pos, _data):
#	Sets what happens when a texture is dropped.
#	Only if the right one is dropped it can't be changed anymore.
	if  $".".texture == null:
		return true
	elif $".".texture == $"../VBoxContainer_pieces1/piece2".texture:
		return true
	elif $".".texture == $"../VBoxContainer_pieces1/piece3".texture:
		return true
	elif $".".texture == $"../VBoxContainer_pieces1/piece4".texture:
		return true
	elif $".".texture == $"../VBoxContainer_pieces1/piece5".texture:
		return true
	elif $".".texture == $"../VBoxContainer_pieces2/piece8".texture:
		return true
	elif $".".texture == $"../VBoxContainer_pieces2/piece9".texture:
		return true
	elif $".".texture == $"../VBoxContainer_pieces1/piece10".texture:
		return true
	elif $".".texture == $"../HBoxContainer1/piece11".texture:
		return true
	elif $".".texture == $"../HBoxContainer1/piece12".texture:
		return true
	elif $".".texture == $"../HBoxContainer1/piece13".texture:
		return true
	elif $".".texture == $"../VBoxContainer_pieces2/piece7".texture:
		return false



func drop_data(_pos, data):
	#When we drop an item in this slot, texture changes & continue button shows
	texture = data["origin_texture"]
	$"../../../Click_correct".play()
	if $"../VBoxContainer_pieces2/piece7".texture == $".".texture:
		$"../VBoxContainer_pieces2/piece7".texture = null
		Global.puzzlePieces += 1

