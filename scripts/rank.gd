extends Node

const RANK_ITEM = preload("res://scenes/menu/rank_item.tscn")

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
			
func _ready():
	var leaderboard = await LevelManager.get_leaderboard()
	
	var rank = 1
	for data in leaderboard.data:
		var rank_item = RANK_ITEM.instantiate()
		rank_item.get_node("Rank").text = "#%d" % rank
		rank_item.get_node("Username").text = data.username
		rank_item.get_node("Time").text = time_convert(int(data.timer_seconds))
		rank_item.get_node("Date").text = data.created_at
		$ScrollContainer/VBoxContainer.add_child(rank_item)
		rank += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu/main_menu.tscn")
