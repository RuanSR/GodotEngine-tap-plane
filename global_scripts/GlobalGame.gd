extends Control

var version = "v1.0.0"

enum game_states {PLAYING, WAITING, GAME_OVER}
enum game_dificulty {EASY, NORMAL, HARD}

var game_stage_index = 0

# SETTING SCENES
var background_index = 4
var pipe_index = 3
var player_index = 2
var save_data_index = 5

var record_score = 0

#CLASSIC STAGE
var classic_title = "Classic"
var classic_description = "Jogue com o tema classico\n de Flappy Bird"
onready var classic_player = preload("res://scenes/players/ClassicPlayer.tscn")
onready var classic_pipe = preload("res://scenes/stagens/classic/ClassicPipes.tscn")
onready var classic_bg = preload("res://scenes/stagens/classic/BGs.tscn")
#index 5
#var classic_save_data = 0

#CLASSIC STAGE
var papagaio_title = "Papagaio"
var papagaio_description = "Jogue com tema do papagaio"
onready var papagaio_player = preload("res://scenes/players/Papagaio.tscn")
onready var papagaio_pipe = preload("res://scenes/stagens/papagaio/PapagaioPipes.tscn")
onready var papagaio_bg = preload("res://scenes/stagens/papagaio/BGs.tscn")
#var papagaio_score = 0

# ARRAY DE VARS
var BOX_CLASSIC_STAGE
var BOX_PAPAGAIO_STAGE

var STAGES

var state
var dificulty = game_dificulty.NORMAL
var sound_fx = true

func _ready():
	BOX_CLASSIC_STAGE = [classic_title,classic_description,classic_player,classic_pipe,classic_bg]
	BOX_PAPAGAIO_STAGE = [papagaio_title, papagaio_description, papagaio_player,papagaio_pipe,papagaio_bg]
	STAGES = [BOX_CLASSIC_STAGE, BOX_PAPAGAIO_STAGE]
	
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
