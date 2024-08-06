extends Button

onready var popupTeamSelec = get_node("/root/TeamSelection/UserTeamConfirmation")

signal sendTeamNumb(teamNumb)

func _ready():
	$"../ScrollContainer_Team1/VBoxContainer_Team1/Container_Cynthia/Cynthia".hide()
	$"../ScrollContainer_Team1/VBoxContainer_Team1/Container_Isaac/Isaac".hide()
	$"../ScrollContainer_Team1/VBoxContainer_Team1/Container_Kilian/Kilian".hide()
	$"../ScrollContainer_Team1/VBoxContainer_Team1/Container_Luc/Luc".hide()
	$"../ScrollContainer_Team1/VBoxContainer_Team1/Container_Marie/Marie".hide()
	$"../ScrollContainer_Team1/VBoxContainer_Team1/Container_Thea/Thea".hide()


func _on_Button_Team1_pressed():
	popupTeamSelec.show()
	emit_signal("sendTeamNumb", 1)

func _on_Button_Team1_mouse_entered():
	$"../ScrollContainer_Team1/VBoxContainer_Team1/Container_Cynthia/Cynthia".show()
	$"../ScrollContainer_Team1/VBoxContainer_Team1/Container_Isaac/Isaac".show()
	$"../ScrollContainer_Team1/VBoxContainer_Team1/Container_Kilian/Kilian".show()
	$"../ScrollContainer_Team1/VBoxContainer_Team1/Container_Luc/Luc".show()
	$"../ScrollContainer_Team1/VBoxContainer_Team1/Container_Marie/Marie".show()
	$"../ScrollContainer_Team1/VBoxContainer_Team1/Container_Thea/Thea".show()


func _on_Button_Team1_mouse_exited():
	$"../ScrollContainer_Team1/VBoxContainer_Team1/Container_Cynthia/Cynthia".hide()
	$"../ScrollContainer_Team1/VBoxContainer_Team1/Container_Isaac/Isaac".hide()
	$"../ScrollContainer_Team1/VBoxContainer_Team1/Container_Kilian/Kilian".hide()
	$"../ScrollContainer_Team1/VBoxContainer_Team1/Container_Luc/Luc".hide()
	$"../ScrollContainer_Team1/VBoxContainer_Team1/Container_Marie/Marie".hide()
	$"../ScrollContainer_Team1/VBoxContainer_Team1/Container_Thea/Thea".hide()
