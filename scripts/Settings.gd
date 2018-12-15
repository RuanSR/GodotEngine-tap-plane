extends Control

onready var easy_check_box = get_node("Panel/CheckBox_easy")
onready var normal_check_box = get_node("Panel/CheckBox_normal")
onready var hard_check_box = get_node("Panel/CheckBox_hard")

onready var sound_fx = get_node("Panel/CheckButton")

var bg_game

var dificulty

func _ready():
	bg_game = GlobalGame.all_stages[GlobalGame.bg_scene_settings][2]
	dificulty = GlobalGame.dificulty
	print(GlobalGame.sound_fx)
	load_bg()
	load_data()

func _on_btn_close_pressed():
	get_tree().change_scene("res://scenes/menu/Manu.tscn")

func load_bg():
	var game = bg_game.instance()
	game.set_pos(Vector2(0,0))
	get_node("BG").add_child(game)

func load_data():
	if dificulty == 0:
		easy_check_box.set_pressed(true)
		normal_check_box.set_pressed(false)
		hard_check_box.set_pressed(false)
	elif dificulty == 1:
		normal_check_box.set_pressed(true)
		easy_check_box.set_pressed(false)
		hard_check_box.set_pressed(false)
	elif dificulty == 2:
		hard_check_box.set_pressed(true)
		easy_check_box.set_pressed(false)
		normal_check_box.set_pressed(false)
	
	if GlobalGame.sound_fx:
		sound_fx.set_pressed(true)
	else:
		sound_fx.set_pressed(false)

func _on_CheckBox_easy_pressed():
	GlobalGame.dificulty = GlobalGame.game_dificulty.EASY
	dificulty = GlobalGame.dificulty
	load_data()

func _on_CheckBox_normal_pressed():
	GlobalGame.dificulty = GlobalGame.game_dificulty.NORMAL
	dificulty = GlobalGame.dificulty
	load_data()

func _on_CheckBox_hard_pressed():
	GlobalGame.dificulty = GlobalGame.game_dificulty.HARD
	dificulty = GlobalGame.dificulty
	load_data()

func _on_CheckButton_pressed():
	is_sound_fx()

func is_sound_fx():
	if sound_fx.is_pressed():
		GlobalGame.sound_fx = true
	else:
		GlobalGame.sound_fx = false