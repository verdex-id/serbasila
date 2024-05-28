extends Node
@onready var music = $"../Music"

func _ready():
	music.kebun_binatang()


func _on_text_edit_text_changed():
	LevelManager.player_username = $"../TextEdit".text
