extends Node2D

var game

func _ready():
	game = get_tree().get_current_scene()
	randomize()

func _on_Timer_timeout():
	if GlobalGame.state == GlobalGame.game_states.PLAYING:
		var pipe = GlobalGame.instanece_pipe()
		pipe.set_pos(Vector2(720,rand_range(230,830)))
		get_owner().add_child(pipe)
