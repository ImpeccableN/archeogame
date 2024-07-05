extends Button

onready var popupTeamSelec = get_node("/root/TeamSelection/UserTeamConfirmation")

signal sendTeamNumb(teamNumb)

func _ready():
	pass


func _on_Button_Team2_pressed():
	popupTeamSelec.show()
	print("Popup opened")
	emit_signal("sendTeamNumb", 2)
	print("emitted signal with number 2")
