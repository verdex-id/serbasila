extends Node

var sila_list = [
	{
		"number": 1,
		"icon_name": "bintang",
		"name": "Ketuhanan yang Maha Esa",
	},
	{
		"number": 2,
		"icon_name": "rantai",
		"name": "Kemanusiaan yang adil dan beradab",
	},
	{
		"number": 3,
		"icon_name": "beringin",
		"name": "Persatuan Indonesia",
	},
	{
		"number": 4,
		"icon_name": "banteng",
		"name": "Kerakyatan yang dipimpin oleh hikmat kebijaksanaan dalam permusyawaratan/perwakilan, serta",
	},
	{
		"number": 5,
		"icon_name": "padikapas",
		"name": "Keadilan sosial bagi seluruh rakyat Indonesia",
	}
]

var current_sila = null

func get_sila():
	if (current_sila != null):
		return current_sila
	current_sila = sila_list.pick_random()
	return current_sila
	
var timer_seconds = 0
