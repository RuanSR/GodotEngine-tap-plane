extends Control

var pre_game
var index_game_preview = 0
var index_game = 1

func _ready():
	print("index_game_preview:",index_game_preview)
	print("index_game", index_game)
	pre_game = (GlobalGame.stages["classic"][index_game_preview])
	inst_game()


func inst_game():
	var game = pre_game.instance()
	game.set_pos(Vector2(0,0))
	get_node("Game").add_child(game)

func _on_btn_right_pressed():
	index_game_preview +=1
	index_game += 1
	print("index_game_preview:",index_game_preview)
	print("index_game", index_game)

func _on_btn_left_pressed():
	index_game_preview -=1
	index_game -= 1
	print("index_game_preview:",index_game_preview)
	print("index_game", index_game)

func _on_btn_play_pressed():
	pass
