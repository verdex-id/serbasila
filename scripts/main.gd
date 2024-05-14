extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var timer_seconds = 0

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

func _on_timer_timeout():
	timer_seconds += 1
	var time = time_convert(timer_seconds)
	$Label.text = time
