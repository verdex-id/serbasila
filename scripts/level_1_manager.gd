extends Node

@onready var timer = $"../Player/Timer"

func _on_level_one_ready():
	Music.kembang_api(45)
	
	timer.timer_start()
	
	$"../Label2".text = "Hi, %s" % [LevelManager.player_username]
	
	var finish_points = get_tree().get_nodes_in_group("finish")
	finish_points.shuffle()
	
	var finish_correct = finish_points[0]
	var sila_correct = LevelManager.get_sila()
	finish_points = finish_points.slice(1)
	finish_correct.set_sila(sila_correct, true)
	
	finish_points = finish_points.filter(func(point): return point != finish_correct)
	var sila_list_incorrect = LevelManager.sila_list.filter(func(sila): return sila != sila_correct)
	
	for point in finish_points:
		point.set_sila(sila_list_incorrect.pick_random(), false)
