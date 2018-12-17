extends Control


#INDEX
var game_title_index = 0
var game_description_index = 1
var game_preview_index = 4
var player_preview_index = 2
var game_index = 4

#OBJECTS
var game_title
var game_description
var player_preview
var game

var bg
var player

func _ready():
	get_node("Logo/Version").set_text(GlobalGame.version)
	load_stage()
	
func inst_preview_player():
	if player != null:
		player.queue_free()
	player = player_preview.instance()
	player.set_pos(Vector2(0,0))
	get_node("Game").add_child(player)

func _on_btn_right_pressed():
	if GlobalGame.game_stage_index+1 != GlobalGame.STAGES.size():
		GlobalGame.game_stage_index +=1
		load_stage()
	else:
		GlobalGame.game_stage_index = 0
		load_stage()

func _on_btn_left_pressed():
	if GlobalGame.game_stage_index-1 >= 0:
		GlobalGame.game_stage_index -=1
		load_stage()
	else:
		GlobalGame.game_stage_index = GlobalGame.STAGES.size()-1
		load_stage()

func _on_btn_play_pressed():
	get_tree().change_scene("res://scenes/stagens/MainGame.tscn")

func load_stage():
	game_title = GlobalGame.STAGES[GlobalGame.game_stage_index][game_title_index]
	game_description = GlobalGame.STAGES[GlobalGame.game_stage_index][game_description_index]
	player_preview = GlobalGame.STAGES[GlobalGame.game_stage_index][player_preview_index]
	get_node("Logo/Stage").set_text(game_title)
	get_node("Logo/Description").set_text(game_description)
	inst_preview_player()
	bg = GlobalGame.instanece_bg()
	get_node(".").add_child(bg)

func _on_btn_settings_pressed():
	get_tree().change_scene("res://scenes/menu/Settings.tscn")
