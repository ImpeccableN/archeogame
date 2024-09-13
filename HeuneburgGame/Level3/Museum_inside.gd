extends TextureRect

onready var reiter_img = $Reiter_Overlay
export var images_grow_scale := Vector2.ZERO

func _on_Button_Reiter_mouse_entered():
	reiter_img.rect_scale = images_grow_scale


func _on_Button_Reiter_mouse_exited():
	reiter_img.rect_scale = Vector2.ONE
