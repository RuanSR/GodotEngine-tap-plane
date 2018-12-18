extends Node

var dificulty = "dificulty"
var sound_fx = "sound_fx" 


var save_file = File.new()
var save_path = "user://save_game.conf"
var save_data = {dificulty : 1, sound_fx : true}

func _ready():
	init_conf()

func init_conf():
	if not save_file.file_exists(save_path):
		create_conf_save()
	else:
		conf_read()
	
func create_conf_save():
	save_file.open(save_path, File.WRITE)
	save_file.store_var(save_data)
	save_file.close()

func conf_save(new_dificulty , new_sound_fx):
	save_data[dificulty] = new_dificulty
	save_data[sound_fx] = new_sound_fx
	save_file.open(save_path, File.WRITE)
	save_file.store_var(save_data)
	save_file.close()

func conf_read():
	save_file.open(save_path, File.READ)
	save_data = save_file.get_var()
	save_file.close()
	GlobalGame.dificulty = save_data[dificulty]
	GlobalGame.sound_fx = save_data[sound_fx]