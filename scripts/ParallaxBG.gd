extends ParallaxBackground


export var bg_is_runing = false
export var speed = 0
var offset_x = 0

func _ready():
	set_process(true)

func _process(delta):
	run_BG(delta)

func run_BG(delta):
	if GlobalGame.state == GlobalGame.game_states.PLAYING or bg_is_runing:
		offset_x -= delta * speed
		set_scroll_offset(Vector2(offset_x,0))