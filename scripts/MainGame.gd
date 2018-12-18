extends Node2D

var game_over_scene = "res://scenes/stagens/MainGameOver.tscn"

onready var lbl_score = get_node("HUD/Score")
onready var lbl_dificulty = get_node("HUD/Dificulty")
onready var lbl_record_score = get_node("HUD/RecordScore")

var background
var player

var score = 0

var player_pos = Vector2(200,1280/2)

func _ready():
	set_process_game(true,true)
	background = GlobalGame.instanece_bg()
	player = GlobalGame.instanece_player()
	player.set_pos(player_pos)
	get_node(".").add_child(background)
	get_node(".").add_child(player)
	GlobalGame.state = GlobalGame.game_states.WAITING
	lbl_score.set_text(str(score))
	lbl_record_score.set_text(str(GlobalGame.record_score))
	lbl_dificulty.set_text(GlobalGame.parse_to_label(GlobalGame.dificulty))

func _input(event):
	if event.type == InputEvent.SCREEN_TOUCH and event.pressed:
		if GlobalGame.state == GlobalGame.game_states.WAITING:
			GlobalGame.state = GlobalGame.game_states.PLAYING

func _process(delta):
	area_die()
	hud()

func count_score():
	score += 1
	if score > GlobalGame.record_score:
		GlobalGame.record_score = score
		lbl_record_score.set_text(str(GlobalGame.record_score))
	lbl_score.set_text(str(score))

func area_die():
	if player.get_pos().y <= 45:
		game_over()
	elif player.get_pos().y >= 1021:
		game_over()
	
func hud():
	var score = get_node("HUD/Score")
	var dificulty = get_node("HUD/Dificulty")
	var ready = get_node("HUD/Ready")
	var record = get_node("HUD/Record")
	var record_score = get_node("HUD/RecordScore")
	if GlobalGame.state == GlobalGame.game_states.WAITING:
		score.hide()
		dificulty.hide()
		record.hide()
		record_score.hide()
		ready.show()
		player.hide()
	else:
		score.show()
		dificulty.show()
		record.show()
		record_score.show()
		ready.hide()
		player.show()
		background.get_child(0).bg_is_runing = false
		background.get_child(1).bg_is_runing = false

func game_over():
	set_process_game(false,true)
	GlobalGame.state = GlobalGame.game_states.GAME_OVER
	player.set_linear_velocity(Vector2(-100,0))
	get_node("Player/Anim").stop()
	get_node("TimerMenu").start()
	if GlobalGame.sound_fx:
		get_node("hit").play()
	save.save(GlobalGame.record_score)

func set_process_game(process, porcess_input):
	set_process(process)
	set_process_input(porcess_input)

func _on_TimeReload_timeout():
	get_tree().change_scene(game_over_scene)
