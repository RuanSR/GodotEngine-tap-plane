extends Node2D

onready var lbl_score = get_node("HUD/Score")
onready var player = get_node("Player")
onready var lbl_dificulty = get_node("HUD/Dificulty")

var score = 0

var player_pos = Vector2(200,1280/2)

func _ready():
	set_process_game(true,true)
	player.set_pos(player_pos)
	lbl_score.set_text(str(score))
	GlobalGame.dificulty = GlobalGame.game_dificulty.NORMAL
	GlobalGame.state = GlobalGame.game_states.WAITING
	lbl_dificulty.set_text(GlobalGame.parse_to_label(GlobalGame.dificulty))
	get_node("HUD/Ready").show()

func _input(event):
	if event.type == InputEvent.SCREEN_TOUCH and event.pressed:
		if GlobalGame.state == GlobalGame.game_states.WAITING:
			GlobalGame.state = GlobalGame.game_states.PLAYING
			get_node("HUD/Ready").hide()

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
	GlobalGame.state = GlobalGame.game_states.GAME_OVER
	get_node("Player/Anim").stop()
	player.set_linear_velocity(Vector2(-100,0))
	get_node("TimerMenu").start()
	get_node("BG").bg_is_runing = false
	get_node("BGGround").bg_is_runing = false

func set_process_game(process, porcess_input):
	set_process(process)
	set_process_input(porcess_input)

func _on_TimeReload_timeout():
	get_tree().change_scene("res://scenes/stagens/classic/ClassicGameOver.tscn")

func _on_TimerStart_timeout():
	#GlobalGame.state = GlobalGame.game_states.PLAYING
	pass
