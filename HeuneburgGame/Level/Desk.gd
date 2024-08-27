extends Node2D


onready var computerlabel = $Desk_Image/ComputerLabel
onready var muglabel = $Desk_Image/Button_Mug/MugLabel
onready var paperslabel = $Desk_Image/Button_Applicationpapers/PapersLabel
onready var diarylabel = $Desk_Image/Button_diary/DiaryLabel




#hides all the labels on first loading of the scene
func _ready():
	computerlabel.hide()
	muglabel.hide()
	paperslabel.hide()
	diarylabel.hide()


#toggle show/hide for the computer tooltip
func _on_Button_Computer_mouse_entered():
	computerlabel.show()

func _on_Button_Computer_mouse_exited():
	computerlabel.hide()


#toggle show/hide for mug commentary
func _on_Button_Mug_mouse_entered():
	muglabel.show()

func _on_Button_Mug_mouse_exited():
	muglabel.hide()


#toggle show/hide for application hint
func _on_Button_Applicationpapers_mouse_entered():
	paperslabel.show()

func _on_Button_Applicationpapers_mouse_exited():
	paperslabel.hide()

#toggle show/hide diary commentary
func _on_Button_diary_mouse_entered():
	diarylabel.show()

func _on_Button_diary_mouse_exited():
	diarylabel.hide()

func _on_Button_Tip1_pressed():
	$Tip.show()
	yield(get_tree().create_timer(3.0), "timeout")
	$Tip.hide()
