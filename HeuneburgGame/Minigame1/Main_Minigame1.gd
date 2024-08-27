extends Node2D

var minigame_scene := preload("res://Minigame1/Minigame1.tscn")
export var minigame_position := Vector2(448, 192)
var started_before = false

#var introduction_message = "Greetings, aspiring archaeologist! Your first mission is about to begin, and it’s a race against time and heat. Here’s how to save those precious artifacts from the force of nature! \nThe Mission: Rescue the artifacts before the sun dries them out again. \nThe Challenges: \nThe Sun: Our biggest nemesis today. If you take too long or move sloppy, you risk getting a massive sunburn. \nThe Excavator: The Excavator is your friend, but it’s been driven by the frantic intern. Watch out for its powerful arm and wheels. \nTips for Success: \n• Be Quick: As soon as an artifact is unearthed, rush to collect it before the sun dries the soil. \n• Stay Alert: Keep an eye on Big Digger’s movements and the position of the sun. Plan your path to avoid both hazards. \n• Prioritize: Some artifacts might be closer to danger. Go for those first to maximize your chances of success. \nControls: \n• Move: Use the arrow keys or W, A, S, D to navigate through the excavation site. \n• Collect Artifacts: Press the spacebar to grab those ancient artifacts. \nMission Failure: \n• Sunburn: If the sun hits you, you’ll get sunburned and have to start over. Remember, sunscreen is your friend! \n• Run Over: Getting hit by the Excavator will end the mission immediately. Stay sharp and agile. \nReady to Dig In? Press \"Start\" to begin your first mission. May the archaeological odds be in your favor!"

func _ready():
	$Minigame1_HUD.show()
#	$Minigame1_HUD.display_message(introduction_message)


func _on_StartButton_button_up():
	var minigame_instance = minigame_scene.instance()
	add_child(minigame_instance)
	minigame_instance.position = minigame_position
	$Minigame1_HUD.hide()
	$Minigame1_HUD/StartButton.disabled = true
