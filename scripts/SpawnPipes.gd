extends Node2D

#export (File, "*.tscn") var wold_scene
#onready export (NodePath) var other_node = get_node(other_node)
#export(String, FILE, "*.tscn") var node
#export(Node2D) node setget set_node
onready var pre_pipe = preload("res://scenes/stagens/classic/ClassicPipes.tscn")
var game

func _ready():
	game = get_tree().get_current_scene()
	randomize()

func _on_Timer_timeout():
	if GlobalGame.state == GlobalGame.game_states.PLAYING:
		var pipe = pre_pipe.instance()
		pipe.set_pos(Vector2(720,rand_range(230,830)))
		get_owner().add_child(pipe)
		print("pipe criado")
