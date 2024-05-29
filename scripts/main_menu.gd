extends Control
	

func _on_exit_pressed():
	get_tree().quit()


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/level/level_one.tscn")


func _on_rank_pressed():
	get_tree().change_scene_to_file("res://scenes/menu/rank.tscn")


func _on_tutorial_pressed():
	get_tree().change_scene_to_file("res://scenes/menu/tutorial.tscn")
