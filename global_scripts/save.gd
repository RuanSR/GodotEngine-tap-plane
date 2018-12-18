extends Node

var index_tilte = 0
var stage_1 
var stage_2


var save_file = File.new()
var save_path = "user://save_game"
var save_data = {stage_1 : 0, stage_2 : 0}

func _ready():
	stage_1 = GlobalGame.BOX_CLASSIC_STAGE[0]
	stage_2 = GlobalGame.BOX_PAPAGAIO_STAGE[0]
	init()

func init():
	if not save_file.file_exists(save_path):
		create_save()
	else:
		read()
	
func create_save():
	save_file.open(save_path, File.WRITE)
	save_file.store_var(save_data)
	save_file.close()

func save(new_high):
	#new_high = 0
	save_data[GlobalGame.STAGES[GlobalGame.game_stage_index][index_tilte]] = new_high
	save_file.open(save_path, File.WRITE)
	save_file.store_var(save_data)
	save_file.close()
	#print("Gravado new_High no game_index "+str(GlobalGame.game_stage_index)+": ",new_high)

func read():
	save_file.open(save_path, File.READ)
	save_data = save_file.get_var()
	save_file.close()
	GlobalGame.record_score = save_data[GlobalGame.STAGES[GlobalGame.game_stage_index][index_tilte]]
	#print("Lido High do game_index "+str(GlobalGame.game_stage_index)+": ",high)