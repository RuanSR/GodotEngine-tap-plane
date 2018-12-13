extends CanvasLayer

func _ready():
	get_node("Dificulty").set_text(GlobalGame.parse_to_label(GlobalGame.dificulty))

func _on_btn_restart_pressed():
	get_tree().change_scene("res://scenes/stagens/classic/MainClassic.tscn")

func _on_btn_menu_pressed():
	get_tree().change_scene("res://scenes/menu/Manu.tscn")
