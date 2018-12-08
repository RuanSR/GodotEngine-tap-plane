extends ParallaxBackground

export var speed = 0
var offset_x = 0

func _ready():
	set_process(true)

func _process(delta):
	offset_x -= delta * speed
	set_scroll_offset(Vector2(offset_x,0))
