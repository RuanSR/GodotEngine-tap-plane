extends Node

enum game_states {PLAYING, WAITING, GAME_OVER}
enum game_dificulty {EASY, NORMAL, HARD}


onready var preview_classic_stage = preload("res://scenes/stagens/classic/BGs.tscn")
onready var classic_stage = preload("res://scenes/stagens/classic/MainClassic.tscn")
var classic_array

var stages 

var state
var dificulty

func _ready():
	
	classic_array = [preview_classic_stage,classic_stage]
	stages = {"classic": classic_array}
	
func parse_to_label(number):
	if number == 0:
		return "EASY"
	elif number == 1:
		return "NORMAL"
	elif number == 2:
		return "HARD"