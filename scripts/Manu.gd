extends Control

#INDEX
var game_stage_index = 0
var game_name_index = 0
var game_description_index = 1
var game_preview_index = 2
var player_preview_index = 3
var game_index = 4

#OBJECTS
var game_name_stage
var game_description
var game_preview
var player_preview
var game

var player

func _ready():
	get_node("Logo/Version").set_text(GlobalGame.version)
	load_stage()

func inst_preview_game():
	var game = game_preview.instance()
	game.set_pos(Vector2(0,0))
	get_node("Game").add_child(game)
	
func inst_preview_player():
	if player != null:
		player.queue_free()
	player = player_preview.instance()
	player.set_pos(Vector2(0,0))
	get_node("Game").add_child(player)

func _on_btn_right_pressed():
	if game_stage_index+1 != GlobalGame.all_stages.size():
		game_stage_index +=1
		load_stage()
	else:
		game_stage_index = 0
		load_stage()

func _on_btn_left_pressed():
	if game_stage_index-1 >= 0:
		game_stage_index -=1
		load_stage()
	else:
		game_stage_index = GlobalGame.all_stages.size()-1
		load_stage()

func _on_btn_play_pressed():
	get_tree().change_scene(game)

func load_stage():
	game_name_stage = GlobalGame.all_stages[game_stage_index][game_name_index]
	game_description = GlobalGame.all_stages[game_stage_index][game_description_index]
	game_preview = GlobalGame.all_stages[game_stage_index][game_preview_index]
	player_preview = GlobalGame.all_stages[game_stage_index][player_preview_index]
	game = GlobalGame.all_stages[game_stage_index][game_index]
	get_node("Logo/Stage").set_text(game_name_stage)
	get_node("Logo/Description").set_text(game_description)
	inst_preview_game()
	inst_preview_player()
