extends TextureRect


func _on_Button_Close_pressed():
	$Diary_bookmarks.hide()
	$ScrollContainer_Team1.show()
	$ScrollContainer_Team2.show()
	$ScrollContainer_Team3.show()
	$Button_Team1.show()
	$Button_Team2.show()
	$Button_Team3.show()
	$Label.show()
	
