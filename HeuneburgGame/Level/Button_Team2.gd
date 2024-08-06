extends Button

onready var popupTeamSelec = get_node("/root/TeamSelection/UserTeamConfirmation")

signal sendTeamNumb(teamNumb)

func _ready():
	$"../ScrollContainer_Team2/VBoxContainer_Team2/Container_Emilia/Emilia".hide()
	$"../ScrollContainer_Team2/VBoxContainer_Team2/Container_Francesco/Francesco".hide()
	$"../ScrollContainer_Team2/VBoxContainer_Team2/Container_Lina/Lina".hide()
	$"../ScrollContainer_Team2/VBoxContainer_Team2/Container_Niko/Niko".hide()
	$"../ScrollContainer_Team2/VBoxContainer_Team2/Container_Sinisa/Sinisa".hide()
	$"../ScrollContainer_Team2/VBoxContainer_Team2/Container_Sofia/Sofia".hide()


func _on_Button_Team2_pressed():
	popupTeamSelec.show()
	emit_signal("sendTeamNumb", 2)


func _on_Button_Team2_mouse_entered():
	$"../ScrollContainer_Team2/VBoxContainer_Team2/Container_Emilia/Emilia".show()
	$"../ScrollContainer_Team2/VBoxContainer_Team2/Container_Francesco/Francesco".show()
	$"../ScrollContainer_Team2/VBoxContainer_Team2/Container_Lina/Lina".show()
	$"../ScrollContainer_Team2/VBoxContainer_Team2/Container_Niko/Niko".show()
	$"../ScrollContainer_Team2/VBoxContainer_Team2/Container_Sinisa/Sinisa".show()
	$"../ScrollContainer_Team2/VBoxContainer_Team2/Container_Sofia/Sofia".show()


func _on_Button_Team2_mouse_exited():
	$"../ScrollContainer_Team2/VBoxContainer_Team2/Container_Emilia/Emilia".hide()
	$"../ScrollContainer_Team2/VBoxContainer_Team2/Container_Francesco/Francesco".hide()
	$"../ScrollContainer_Team2/VBoxContainer_Team2/Container_Lina/Lina".hide()
	$"../ScrollContainer_Team2/VBoxContainer_Team2/Container_Niko/Niko".hide()
	$"../ScrollContainer_Team2/VBoxContainer_Team2/Container_Sinisa/Sinisa".hide()
	$"../ScrollContainer_Team2/VBoxContainer_Team2/Container_Sofia/Sofia".hide()
