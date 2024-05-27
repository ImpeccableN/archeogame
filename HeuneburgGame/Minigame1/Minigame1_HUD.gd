extends CanvasLayer

onready var score_label = $ScoreLabel



func _on_Minigame1_score_up(score):
	score_label.text = str(score)
	


func _on_Player_hit():
	$StartButton.show()
	$StartButton.disabled = false


func _on_StartButton_button_up():
	$StartButton.hide()
	$StartButton.disabled = true
