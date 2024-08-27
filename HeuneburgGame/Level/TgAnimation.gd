extends VideoPlayer

func _on_Button_nextPage_pressed():
		$SoundFlip.play()
		$TgStatic/Label_Introtxt1.hide()
		$TgStatic/Label_Introtxt2.hide()
		$TgStatic/Label_Introtxt3.show()
		$TgStatic/Label_Introtxt4.show()
		$TgStatic/Button_nextPage.hide()
		$Close_introTxt.show()


func _on_Close_introTxt_pressed():
	$".".hide()
	$"../FirstLevel_Image".show()
	$"../Bauwagen_Overlay".show()
	$"../Freilichtmuseum_Overlay".show()
	$"../Grabungsstaette_Overlay".show()
	$"../Keltenmuseum_Overlay".show()
