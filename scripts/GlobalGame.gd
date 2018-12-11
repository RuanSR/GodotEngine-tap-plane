extends Node

enum game_states {PLAYING, WAITING, GAME_OVER}
enum game_dificulty {EASY, NORMAL, HARD}

var state
var dificulty

func _ready():
	dificulty = game_dificulty.EASY
	
func parse_to_label(number):
	if number == 0:
		return "EASY"
	elif number == 1:
		return "NORMAL"
	elif number == 2:
		return "HARD"