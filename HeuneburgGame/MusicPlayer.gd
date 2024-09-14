extends AudioStreamPlayer

func play_profilkasten():
	if is_playing():
		stop()
	stream = load("res://Music/profilkasten_final.wav")
	play()

func play_mapmusic():
	if is_playing():
		stop()
	stream = load("res://Music/map_final.wav")
	play()


func play_museummusic():
	if is_playing():
		stop()
	stream = load("res://Music/museum_final.wav")
	play()


func play_titletheme():
	stream = load("res://Music/title.wav")
	play()
