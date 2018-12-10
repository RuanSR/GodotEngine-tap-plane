extends Node2D

onready var lbl_score = get_node("HUD/Score")
onready var player = get_node("Player")

enum game_states {PLAYING, WAITING, STOPED}

var score = 0
var state

var player_pos = Vector2(200,1280/2)

func _ready():
	set_process_game(true,true)
	player.set_pos(player_pos)
	lbl_score.set_text(str(score))
	state = game_states.PLAYING

func _input(event):
	if event.is_action_pressed("ui_touch"):
		#state = game_states.PLAYING
		pass

func _process(delta):
	area_die()

func count_score():
	score += 1
	lbl_score.set_text(str(score))

func area_die():
	if player.get_pos().y <= 45:
		print("DIE")
		game_over()
	elif player.get_pos().y >= 1021:
		print("DIE")
		game_over()

func game_over():
	set_process_game(false,true)
	state = game_states.STOPED
	get_node("Player/Anim").stop()
	player.set_linear_velocity(Vector2(-100,0))

func set_process_game(process, porcess_input):
	set_process(process)
	set_process_input(porcess_input)