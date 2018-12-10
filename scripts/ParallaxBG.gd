extends ParallaxBackground

var game

export var speed = 0
var offset_x = 0

func _ready():
	set_process(true)
	game = get_tree().get_current_scene()

func _process(delta):
	run_BG(delta)

func run_BG(delta):
	if game.state == game.game_states.PLAYING:
		offset_x -= delta * speed
		set_scroll_offset(Vector2(offset_x,0))