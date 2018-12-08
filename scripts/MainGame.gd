extends Node2D

onready var lbl_score = get_node("HUD/Score")
var score = 0
enum game_states {PLAYING, WAITING, STOPED}
var state 

func _ready():
	lbl_score.set_text(str(score))
	state = game_states.WAITING

func count_score():
	score += 1
	lbl_score.set_text(str(score))
	
func game_over():
	state = game_states.STOPED