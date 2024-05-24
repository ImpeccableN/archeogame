extends CanvasLayer

onready var score_label = $ScoreLabel



func _on_Minigame1_score_up(score):
	score_label.text = str(score)
	
