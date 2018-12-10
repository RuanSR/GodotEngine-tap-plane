extends RigidBody2D

var game
var inpulse_force = -500

func _ready():
	set_process_input(true)
	set_process(true)
	set_linear_velocity(Vector2(0,0))
	game = get_tree().get_current_scene()
	get_node("Anim").play()

func _process(delta):
	if game.state == game.game_states.WAITING:
		set_gravity_scale(0)
	elif game.state == game.game_states.PLAYING:
		set_gravity_scale(10)

func _input(event):
	if event.is_action_pressed("ui_touch"):
		if game.state == game.game_states.PLAYING:
			tap()
		elif game.state == game.game_states.WAITING:
			print("ESPERANDO")
		else:
			print("GAME_OVER")

func tap():
	set_linear_velocity(Vector2(0,inpulse_force))

