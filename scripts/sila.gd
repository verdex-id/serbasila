extends Area2D

@onready var sila_object = %SilaObject

func _ready():
	var sila = LevelManager.get_sila()
	sila_object.animation = sila.icon_name
	
func _on_body_entered(body):
	if (body.name == "Player"):
		queue_free()
