extends Node2D


onready var keltenmuseum_image = get_node("Keltenmuseum_Overlay")
onready var bauwagen_image = get_node("Bauwagen_Overlay")
export var images_grow_scale := Vector2.ZERO

func _ready():
	MusicPlayer.play_mapmusic()


func _on_Button_Bauwagen_mouse_entered():
	bauwagen_image.rect_scale = images_grow_scale


func _on_Button_Bauwagen_mouse_exited():
	bauwagen_image.rect_scale = Vector2.ONE


func _on_Button_Keltenmuseum_mouse_entered():
	keltenmuseum_image.rect_scale = images_grow_scale


func _on_Button_Keltenmuseum_mouse_exited():
	keltenmuseum_image.rect_scale = Vector2.ONE

