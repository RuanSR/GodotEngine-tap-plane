extends Node

var version = "v0.9.3"

enum game_states {PLAYING, WAITING, GAME_OVER}
enum game_dificulty {EASY, NORMAL, HARD}

var game_stage_index = 0

# SETTING SCENES
var background_index = 4
var pipe_index = 3
var player_index = 2

#CLASSIC STAGE
#index 0
var classic_title = "Classic"
#index 1
var classic_description = "Jogue com o tema classico\n de Flappy Bird"
#index 2
onready var classic_player = preload("res://scenes/players/ClassicPlayer.tscn")
#index 3
onready var classic_pipe = preload("res://scenes/stagens/classic/ClassicPipes.tscn")
#index 4
onready var classic_bg = preload("res://scenes/stagens/classic/BGs.tscn")

#CLASSIC STAGE
#index 0
var papagaio_title = "Papagaio"
#index 1
var papagaio_description = "Jogue com tema do papagaio"
#index 2
onready var papagaio_player = preload("res://scenes/players/Papagaio.tscn")
#index 3
onready var papagaio_pipe = preload("res://scenes/stagens/papagaio/PapagaioPipes.tscn")
#index 4
onready var papagaio_bg = preload("res://scenes/stagens/papagaio/BGs.tscn")

# ARRAY DE VARS
var BOX_CLASSIC_STAGE
var BOX_PAPAGAIO_STAGE

var STAGES

var state
var dificulty
var sound_fx

func _ready():
	BOX_CLASSIC_STAGE = [classic_title,classic_description,classic_player,classic_pipe,classic_bg]
	BOX_PAPAGAIO_STAGE = [papagaio_title, papagaio_description, papagaio_player,papagaio_pipe,papagaio_bg]
	STAGES = [BOX_CLASSIC_STAGE, BOX_PAPAGAIO_STAGE]
	
	sound_fx = true
	dificulty = game_dificulty.NORMAL

func instanece_bg():
	var bg = STAGES[game_stage_index][background_index]
	return bg.instance()

func instanece_pipe():
	var pipe = STAGES[game_stage_index][pipe_index]
	return pipe.instance()

func instanece_player():
	var player = STAGES[game_stage_index][player_index]
	return player.instance()

func parse_to_label(number):
	if number == 0:
		return "EASY"
	elif number == 1:
		return "NORMAL"
	elif number == 2:
		return "HARD"