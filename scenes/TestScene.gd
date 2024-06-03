extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	print("A")
	var leaderboard = await LevelManager.get_leaderboard()
	print("B")
	print(leaderboard)
