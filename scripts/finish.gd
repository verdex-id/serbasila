extends Area2D
@onready var level_1_manager = $"../Level1Manager"
@onready var label = $Label

var is_correct = false

func _on_body_entered(body):
	if (body.name == "Player"):
		if (is_correct):
			label.text = "Benar!"
			Music.stop()
			get_tree().change_scene_to_file("res://scenes/level/level_test.tscn")
		else:
			label.text = "Salah!"

func set_sila(sila, value):
	is_correct = value
	label.text = "Sila ke-%d\n%s" % [sila.number, sila.name]
