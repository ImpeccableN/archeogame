extends TextureRect



func _on_Button_nextPage1_pressed():
	
	$Glossar_p2.show()


func _on_Button_nextPage2_pressed():
	$Glossar_p3.show()
	$PageFlip.play()

func _on_Button_prevPage2_pressed():
	$Glossar_p2.hide()
	$".".show()
	$PageFlip.play()


func _on_Button_nextPage3_pressed():
	$Glossar_p4.show()
	$PageFlip.play()


func _on_Button_prevPage3_pressed():
	$Glossar_p3.hide()
	$Glossar_p2.show()
	$PageFlip.play()


func _on_Button_nextPage4_pressed():
	$Glossar_p5.show()
	$PageFlip.play()


func _on_Button_prevPage5_pressed():
	$Glossar_p5.hide()
	$Glossar_p4.show()
	$PageFlip.play()


func _on_Button_prevPage4_pressed():
	$Glossar_p4.hide()
	$Glossar_p3.show()
	$PageFlip.play()


func _on_Button_Close1_pressed():
	$BookClose.play()
	get_tree().change_scene("res://Level/ComputerMonitor.tscn")


func _on_Button_Close2_pressed():
	$BookClose.play()
	get_tree().change_scene("res://Level/ComputerMonitor.tscn")


func _on_Button_Close3_pressed():
	$BookClose.play()
	get_tree().change_scene("res://Level/ComputerMonitor.tscn")



func _on_Button_Close4_pressed():
	$BookClose.play()
	get_tree().change_scene("res://Level/ComputerMonitor.tscn")


func _on_Button_Close5_pressed():
	$BookClose.play()
	get_tree().change_scene("res://Level/ComputerMonitor.tscn")
