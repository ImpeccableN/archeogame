extends TextureRect

func _ready():
	$ProfilkastenPhoto.texture = Global.photo


func _on_Button_nextDay_pressed():
	get_tree().change_scene("res://Minigame3/DiaryLvl3.tscn")
