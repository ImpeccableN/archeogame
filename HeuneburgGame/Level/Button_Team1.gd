extends Button

onready var teamSelectT1 = "res://Level/Global.gd"
onready var popupTeamSelec = get_node("/root/TeamSelection/UserTeamConfirmation")

func _ready():
	pass

func _on_decline_pressed():
	popupTeamSelec.hide()

func _on_Button_Team1_pressed():
	popupTeamSelec.show()

