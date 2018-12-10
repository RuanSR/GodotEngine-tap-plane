extends Node2D

onready var lbl_score = get_node("HUD/Score")
onready var player = get_node("Player")

enum game_states {PLAYING, WAITING, STOPED}

var score = 0
var state

var player_pos = Vector2(310,1280/2)

func _ready():
	set_process_game()
	player.set_pos(player_pos)
	lbl_score.set_text(str(score))
	state = game_states.WAITING

func _input(event):
	if event.is_action_pressed("ui_touch"):
		state = game_states.PLAYING

func count_score():
	score += 1
	lbl_score.set_text(str(score))
	
func game_over():
	state = game_states.STOPED

func set_process_game():
	set_process(false)
	set_process_input(true)