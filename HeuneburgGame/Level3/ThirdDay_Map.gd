extends Node2D


onready var keltenmuseum_image = get_node("Keltenmuseum_Overlay")
onready var bauwagen_image = get_node("Bauwagen_Overlay")
onready var video_player = get_node("OutroVideoPlayer")
export var images_grow_scale := Vector2.ZERO

func _ready():
	if not MusicPlayer.is_playing():
		MusicPlayer.play_mapmusic()


func _on_Button_Bauwagen_mouse_entered():
	bauwagen_image.rect_scale = images_grow_scale


func _on_Button_Bauwagen_mouse_exited():
	bauwagen_image.rect_scale = Vector2.ONE


func _on_Button_Keltenmuseum_mouse_entered():
	keltenmuseum_image.rect_scale = images_grow_scale


func _on_Button_Keltenmuseum_mouse_exited():
	keltenmuseum_image.rect_scale = Vector2.ONE



func _on_OutroVideoPlayer_finished():
	get_tree().change_scene("res://Minigame3/DiaryLvl3.tscn")


func _on_DisasterScore_disaster_score_finished():
	if Global.puzzle_done:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		yield(get_tree().create_timer(2),"timeout")
		MusicPlayer.stop()
		video_player.show()
		video_player.play()
