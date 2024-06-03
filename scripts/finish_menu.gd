extends Node

func time_convert(time_in_sec):
	var seconds = time_in_sec%60
	var minutes = (time_in_sec/60)%60
	var hours = (time_in_sec/60)/60
	
	#returns a string with the format "HH:MM:SS"
	if (minutes == 0):
		return "%02ds" % [seconds]
		
	elif (minutes > 0):
		if (hours == 0):
			return "%02d:%02d" % [minutes, seconds]
		elif (hours > 0):
			return "%02d:%02d:%02d" % [hours, minutes, seconds]
# Called when the node enters the scene tree for the first time.

func _ready():
	$Label2.text = "Selamat %s kamu telah menamatkan game Serbasila!" % [LevelManager.player_username]
	$TimeScore.text = "Waktu yang ditempuh: %s (Updating Ranking...)" % [time_convert(LevelManager.timer_seconds)]
	await LevelManager.save_leaderboard()
	$TimeScore.text = "Waktu yang ditempuh: %s" % [time_convert(LevelManager.timer_seconds)]


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu/main_menu.tscn")


func _on_rank_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu/rank.tscn")
