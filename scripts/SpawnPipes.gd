extends Node2D

onready var pre_pipe = preload("res://scenes/stagens/classic/ClassicPipes.tscn")
var game

func _ready():
	game = get_tree().get_current_scene()
	randomize()

func _on_Timer_timeout():
	if game.state == game.game_states.PLAYING:
		var pipe = pre_pipe.instance()
		pipe.set_pos(Vector2(720,rand_range(230,830)))
		get_owner().add_child(pipe)
		print("pipe criado")
