extends Button

onready var teamSelectT2 = "res://Level/Global.gd"
onready var popupTeamSelec = get_node("/root/TeamSelection/UserTeamConfirmation")

func _ready():
	pass

func _on_decline_pressed():
	popupTeamSelec.hide()

func _on_Button_Team2_pressed():
	popupTeamSelec.show()

