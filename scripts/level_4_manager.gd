extends Node

@onready var timer = $"../Player/Timer"


func _on_level_four_ready():
	Music.cahaya_panjang(100)
	timer.timer_start()



func _on_flag_body_entered(body):
	if (body.name == "Player"):
		get_tree().change_scene_to_file("res://scenes/level/level_five.tscn")


func _on_flag_2_body_entered(body):
	if (body.name == "Player"):
		$"../Flag2/Label".text = "Salah!"
