extends Area2D
@onready var level_1_manager = $"../Level1Manager"
@onready var label = $Label

var is_correct = false

func _on_body_entered(body):
	if (body.name == "Player"):
		if (is_correct):
			label.text = "Benar!"
			Music.stop()
			LevelManager.set_random_sila()
			if (get_tree().current_scene.name == "LevelOne"):
				get_tree().change_scene_to_file("res://scenes/level/level_two.tscn")
			elif (get_tree().current_scene.name == "LevelTwo"):
				get_tree().change_scene_to_file("res://scenes/level/level_three.tscn")
			elif (get_tree().current_scene.name == "LevelThree"):
				get_tree().change_scene_to_file("res://scenes/level/level_four.tscn")
			elif (get_tree().current_scene.name == "LevelFour"):
				get_tree().change_scene_to_file("res://scenes/level/level_five.tscn")
			elif (get_tree().current_scene.name == "LevelFive"):
				get_tree().change_scene_to_file("res://scenes/menu/finish.tscn")
				
		else:
			label.text = "Salah!"

func set_sila(sila, value):
	is_correct = value
	label.text = "Sila ke-%d\n%s" % [sila.number, sila.name]
