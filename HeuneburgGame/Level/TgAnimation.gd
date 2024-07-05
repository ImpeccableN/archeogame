extends VideoPlayer


func _physics_process(delta):
	if Input.is_action_just_pressed("click_button"):
		play()
		$SoundFlip.play()


func _on_TgFlip_finished():
	$TgStatic.show()
