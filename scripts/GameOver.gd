extends Node2D

func _ready():
	get_node(".").add_child(GlobalGame.instanece_bg())
	get_node("HUD/Dificulty").set_text(GlobalGame.parse_to_label(GlobalGame.dificulty))

func _on_btn_restart_pressed():
	get_tree().change_scene("res://scenes/stagens/MainGame.tscn")

func _on_btn_menu_pressed():
	get_tree().change_scene("res://scenes/menu/Manu.tscn")
