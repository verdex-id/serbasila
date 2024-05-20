extends Node

@onready var timer = $"../Player/Timer"

func _on_level_two_ready():
	Music.ponytail(0)
	
	timer.timer_start()
	
	var finish_points = get_tree().get_nodes_in_group("finish")
	finish_points.shuffle()
	
	var finish_correct = finish_points[0]
	finish_points = finish_points.slice(1)
	finish_correct.set_sila(LevelManager.get_sila(), true)
	
	finish_points = finish_points.filter(func(point): return point != finish_correct)
	
	for point in finish_points:
		point.set_sila(LevelManager.sila_list.pick_random(), false)