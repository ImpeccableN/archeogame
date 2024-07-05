extends Button

onready var popupTeamSelec = get_node("/root/TeamSelection/UserTeamConfirmation")

signal sendTeamNumb(teamNumb)

func _ready():
	pass


func _on_Button_Team1_pressed():
	popupTeamSelec.show()
	print("Popup opened")
	emit_signal("sendTeamNumb", 1)
	print("emitted signal with number 1")

