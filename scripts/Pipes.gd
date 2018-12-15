extends Node2D

#POSITION EASY
onready var sprite_pipe_top = get_node("Sprites/Top")
onready var collision_pipe_top = get_node("AreaCollision/AreaDie/CollisionPipeTop")

var game
var speed = 250
var dificulty
var limit_pipe_delete = -200

#POSITION EASY
var easy_pipe_top_sprite = Vector2(0,-1100)
var easy_pipe_top_collider = Vector2(52,-623)

#POSITION NORMAL
var normal_pipe_top_sprite = Vector2(0,-1050)
var normal_pipe_top_collider = Vector2(52,-580)

#POSITION HARD
var hard_pipe_top_sprite = Vector2(0,-1000)
var hard_pipe_top_collider = Vector2(52,-525)

func _ready():
	set_process_game()
	game = get_tree().get_current_scene()

func _process(delta):
	if GlobalGame.state == GlobalGame.game_states.PLAYING:
		set_dificulty_game(delta)
	if get_pos().x <= limit_pipe_delete:
		queue_free()

func set_dificulty_game(delta):
	if GlobalGame.dificulty == GlobalGame.game_dificulty.EASY:
		sprite_pipe_top.set_pos(easy_pipe_top_sprite)
		collision_pipe_top.set_pos(easy_pipe_top_collider)
	elif GlobalGame.dificulty == GlobalGame.game_dificulty.NORMAL:
		sprite_pipe_top.set_pos(normal_pipe_top_sprite)
		collision_pipe_top.set_pos(normal_pipe_top_collider)
	elif GlobalGame.dificulty == GlobalGame.game_dificulty.HARD:
		sprite_pipe_top.set_pos(hard_pipe_top_sprite)
		collision_pipe_top.set_pos(hard_pipe_top_collider)
	set_pos(get_pos() - Vector2(speed * delta,0))

func set_process_game():
	set_process(true)

func _on_AreaDie_body_enter( body ):
	if GlobalGame.state == GlobalGame.game_states.PLAYING:
		if body.get_name() == "Player":
			if GlobalGame.sound_fx:
				get_node("Sound_fx/hit").play()
			game.game_over()

func _on_AreaPoints_body_enter( body ):
	if body.get_name() == "Player":
		if GlobalGame.sound_fx:
			get_node("Sound_fx/point").play()
		game.count_score()
