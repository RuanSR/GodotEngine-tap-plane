extends Node

enum game_states {PLAYING, WAITING, GAME_OVER}
enum game_dificulty {EASY, NORMAL, HARD}


onready var preview_classic_stage = preload("res://scenes/stagens/classic/BGs.tscn")
onready var preview_classic_player = preload("res://scenes/players/ClassicPlayer.tscn")

var pack_classic_stage

var all_stages

var state
var dificulty

func _ready():
	pack_classic_stage = ["Classic","Jogue com o tema classico de Flappy Bird",preview_classic_stage, preview_classic_player, "res://scenes/stagens/classic/MainClassic.tscn"]
	all_stages = [pack_classic_stage]
	
func parse_to_label(number):
	if number == 0:
		return "EASY"
	elif number == 1:
		return "NORMAL"
	elif number == 2:
		return "HARD"