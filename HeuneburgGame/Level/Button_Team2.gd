extends Button

onready var popupTeamSelec = get_node("/root/TeamSelection/UserTeamConfirmation")

signal sendTeamNumb(teamNumb)

func _ready():
	pass


func _on_Button_Team2_pressed():
	popupTeamSelec.show()
	emit_signal("sendTeamNumb", 2)
