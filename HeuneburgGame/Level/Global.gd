extends Node

#data only for global variables. Saves player choices

#keeps track of the amount of disaster points gathered
var disasterScore = 0

#for application score
var scoreApplication : int = 0 

#team selected
var teamSelect = 0

#package selected
var packageSelect = 0

#keep track of mingame completion in level 1
var minigame_digger_done = false
var minigame_werkzeuge_done = false

#keeps track of minigame completion in lvl2
var profilkasten_done: bool = false

#keeps track of placed pieces in vase puzzle
var puzzlePieces = 0

#temp save of picture taken of profilkasten
var photo : ImageTexture


func calculate_disaster(score):
	disasterScore += score
