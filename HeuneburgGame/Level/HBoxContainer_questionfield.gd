extends HBoxContainer

onready var scoreApplication = $"."

#variables for textureRects
onready var answer1 = $"../VBoxContainer_answerfield/Answer1"
onready var answer2 = $"../VBoxContainer_answerfield/Answer2"
onready var answer3 = $"../VBoxContainer_answerfield/Answer3"

#variables for the questions
var question1L1 = "What are you going to do and planning to find?"
var question1L2 = "Insert Name of Applicant:"
var question2L1 = "Who will be in your team?"
var question2L2 = "What equipment do you need?"
var question3L2 = "How much time do you need for each phase?"
var question5L1 = "What accommodation do you need?"
var question6L1 = "How much money do you need?"
var question7L1 = "What transport do you need?"
var question8L1 = "Are you going to plan on doing animal testing?"
var questionBlank = ""
#counter for gradual continuation
var questionState = 0

#code for the application. Everytime the button is pressed, the next question
#with answer possibilities appears
func _on_ContinueButton_pressed():
	
	if questionState == 0:
		$Label1.text = question1L1
		$Label1/Label2.text = questionBlank
		questionState += 1
	
	elif questionState == 1:
		$Label1.text = question2L1
		#loads new textures for answer field
		answer1.texture = load("res://Level/AnswerGraphics/2.1.png") 
		answer2.texture = load("res://Level/AnswerGraphics/2.3.png")
		answer3.texture = load("res://Level/AnswerGraphics/2.2.png") 
		questionState += 1
	
	elif questionState == 2:
		$Label1.text = question2L2
		answer1.texture = load("res://Level/AnswerGraphics/3.1.png")
		answer2.texture = load("res://Level/AnswerGraphics/3.3.png")
		answer3.texture = load("res://Level/AnswerGraphics/3.2.png")
		questionState += 1
	
	elif questionState == 3:
		$Label1.text = question3L2
		answer1.texture = load("res://Level/AnswerGraphics/4.1.png")
		answer2.texture = load("res://Level/AnswerGraphics/4.3.png")
		answer3.texture = load("res://Level/AnswerGraphics/4.2.png")
		questionState += 1
	
	elif questionState == 4:
		$Label1.text = question5L1
		answer1.texture = load("res://Level/AnswerGraphics/5.2.png") 
		answer2.texture = load("res://Level/AnswerGraphics/5.3.png")
		answer3.texture = load("res://Level/AnswerGraphics/5.1.png")
		questionState += 1 
	
	elif questionState == 5:
		$Label1.text = question6L1
		answer1.texture = load("res://Level/AnswerGraphics/6.1.png")
		answer2.texture = load("res://Level/AnswerGraphics/6.3.png")
		answer3.texture = load("res://Level/AnswerGraphics/6.2.png")
		questionState += 1
	
	elif questionState == 6:
		$Label1.text = question7L1
		answer1.texture = load("res://Level/AnswerGraphics/7.1.png")
		answer2.texture = load("res://Level/AnswerGraphics/7.3.png")
		answer3.texture = load("res://Level/AnswerGraphics/7.2.png")
		questionState += 1
	
	elif questionState == 7:
		$Label1.text = question8L1
		answer1.texture = load("res://Level/AnswerGraphics/8.1.png")
		answer2.texture = load("res://Level/AnswerGraphics/8.3.png")
		answer3.texture = load("res://Level/AnswerGraphics/8.2.png")
		questionState += 1
	
	#conditions for application acception or dismissal
	elif questionState == 8 and Global.scoreApplication < 8:
		get_tree().change_scene("res://Level/ApplicationDenied.tscn")
	
	elif questionState == 8 and Global.scoreApplication >= 8:
		get_tree().change_scene("res://Level/ApplicationAccepted.tscn")
