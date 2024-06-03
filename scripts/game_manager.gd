extends Node

func _ready():
	Music.kebun_binatang()


func _on_text_edit_text_changed():
	LevelManager.player_username = $"../TextEdit".text
