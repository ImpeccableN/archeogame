extends Node

#variables to measure time spent on certain games
var start_time
var end_time

#data only for global variables. Saves player choices

#keeps track of the amount of disaster points gathered
var disaster_score = 0

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

#adds disaster points from games to global score
func calculate_disaster(score):
	disaster_score += score

#saves start time of certain games
func start_timer():
	start_time = OS.get_unix_time()


func calculate_time() -> int:
	end_time = OS.get_unix_time()
	var elapsed_time = end_time - start_time
	return elapsed_time
