extends CanvasLayer

export (String, FILE, "*.tscn") var restart_scene

func _ready():
	get_node("Dificulty").set_text(GlobalGame.parse_to_label(GlobalGame.dificulty))

func _on_btn_restart_pressed():
	get_tree().change_scene(restart_scene)

func _on_btn_menu_pressed():
	get_tree().change_scene("res://scenes/menu/Manu.tscn")
