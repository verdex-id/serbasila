extends Node

@onready var timer = $"../Player/Timer"



func _on_level_five_ready():
	timer.timer_start()
