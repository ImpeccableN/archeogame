extends Node

#data only for global variables. Saves player choices

#for application score
var scoreApplication : int = 0 

#team selected
var teamSelect = 0

#package selected
var packageSelect = 0

#keep track of mingame completion in level 1
var minigame_digger_done = false
var minigame_werkzeuge_done = false

#keeps track of placed pieces in vase puzzle
var puzzlePieces = 0

#temp save of picture taken of profilkasten
var photo : ImageTexture
