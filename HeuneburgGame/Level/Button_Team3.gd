extends Button

onready var popupTeamSelec = get_node("/root/TeamSelection/UserTeamConfirmation")

signal sendTeamNumb(teamNumb)

func _ready():
	$"../ScrollContainer_Team3/VBoxContainer_Team3/Container_Diego/Diego".hide()
	$"../ScrollContainer_Team3/VBoxContainer_Team3/Container_Jupp/Jupp".hide()
	$"../ScrollContainer_Team3/VBoxContainer_Team3/Container_Lydia/Lydia".hide()
	$"../ScrollContainer_Team3/VBoxContainer_Team3/Container_Thilo/Thilo".hide()
	$"../ScrollContainer_Team3/VBoxContainer_Team3/Container_Thommy/Thommy".hide()
	$"../ScrollContainer_Team3/VBoxContainer_Team3/Container_Tilda/Tilda".hide()


func _on_Button_Team3_pressed():
	popupTeamSelec.show()
	emit_signal("sendTeamNumb", 3)


func _on_Button_Team3_mouse_entered():
	$"../ScrollContainer_Team3/VBoxContainer_Team3/Container_Diego/Diego".show()
	$"../ScrollContainer_Team3/VBoxContainer_Team3/Container_Jupp/Jupp".show()
	$"../ScrollContainer_Team3/VBoxContainer_Team3/Container_Lydia/Lydia".show()
	$"../ScrollContainer_Team3/VBoxContainer_Team3/Container_Thilo/Thilo".show()
	$"../ScrollContainer_Team3/VBoxContainer_Team3/Container_Thommy/Thommy".show()
	$"../ScrollContainer_Team3/VBoxContainer_Team3/Container_Tilda/Tilda".show()
	

func _on_Button_Team3_mouse_exited():
	$"../ScrollContainer_Team3/VBoxContainer_Team3/Container_Diego/Diego".hide()
	$"../ScrollContainer_Team3/VBoxContainer_Team3/Container_Jupp/Jupp".hide()
	$"../ScrollContainer_Team3/VBoxContainer_Team3/Container_Lydia/Lydia".hide()
	$"../ScrollContainer_Team3/VBoxContainer_Team3/Container_Thilo/Thilo".hide()
	$"../ScrollContainer_Team3/VBoxContainer_Team3/Container_Thommy/Thommy".hide()
	$"../ScrollContainer_Team3/VBoxContainer_Team3/Container_Tilda/Tilda".hide()
