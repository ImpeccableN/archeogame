extends Area2D

#first add TeamMember as Node to tree. Then team_mamber_data var equals TeamMember Node
onready var team_member_data = $TeamMember_Kilian

func _ready():
	print(team_member_data.member_headshot_path)
	$Sprite.texture = load(team_member_data.member_headshot_path)

func _on_WerkzeugPerson_mouse_entered():
	$Sprite/InfoBox.show()


func _on_WerkzeugPerson_mouse_exited():
	$Sprite/InfoBox.hide()
