extends Node2D

var game
var speed = 200
var limit_pipe_delete = -100

func _ready():
	set_process_game()
	game = get_tree().get_current_scene()

func _process(delta):
	if game.state == game.game_states.PLAYING:
		var pos_x = get_pos().x
		pos_x -= speed * delta
		set_pos(Vector2(pos_x,0))
	
	if get_pos().x <= limit_pipe_delete:
		print("PIPE: DELETED")
		queue_free()



func set_process_game():
	set_process(true)