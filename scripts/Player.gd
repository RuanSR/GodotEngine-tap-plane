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
	if GlobalGame.state == GlobalGame.game_states.WAITING:
		set_gravity_scale(0)
	elif GlobalGame.state == GlobalGame.game_states.PLAYING:
		set_gravity_scale(10)

func _input(event):
	if event.is_action_pressed("ui_touch"):
		if GlobalGame.state == GlobalGame.game_states.PLAYING:
			tap()

func tap():
	set_linear_velocity(Vector2(0,inpulse_force))
	get_node("AnimPlayer").play("up")
	if GlobalGame.sound_fx:
		get_node("fly_fx").play()
