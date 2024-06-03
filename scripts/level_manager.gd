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
var player_username = "Player"

func set_random_sila():
	sila_list.shuffle()
	current_sila = sila_list.pick_random()
	
func get_sila():
	if (current_sila != null):
		return current_sila
	set_random_sila()
	return current_sila
	
var timer_seconds = 0

var http = HTTPClient.new()
# https://serbasila-api.vercel.app/leaderboard
var base_url = "https://serbasila-api.vercel.app"
var port = -1
var api_url = "https://serbasila-api.vercel.app/leaderboard"

func get_leaderboard():
	var err
	
	err = http.connect_to_host(base_url, port) # Connect to host/port.
	assert(err == OK) # Make sure connection is OK.

	# Wait until resolved and connected.
	while http.get_status() == HTTPClient.STATUS_CONNECTING or http.get_status() == HTTPClient.STATUS_RESOLVING:
		http.poll()
		await get_tree().process_frame
	
	assert(http.get_status() == HTTPClient.STATUS_CONNECTED)
	
	err = http.request(HTTPClient.METHOD_GET, api_url, [])
	assert(err == OK) # Make sure all is OK.

	while http.get_status() == HTTPClient.STATUS_REQUESTING:
		# Keep polling for as long as the request is being processed.
		http.poll()
		await get_tree().process_frame

	assert(http.get_status() == HTTPClient.STATUS_BODY or http.get_status() == HTTPClient.STATUS_CONNECTED) # Make sure request finished well.

	if (http.has_response()):
		var rb = PackedByteArray() # Array that will hold the data.
		while http.get_status() == HTTPClient.STATUS_BODY:
			http.poll()
			var chunk = http.read_response_body_chunk()
			if chunk.size() == 0:
				await get_tree().process_frame
			else:
				rb = rb + chunk
				
		var text = rb.get_string_from_ascii()
		var data = JSON.parse_string(text)
		return data
		
func save_leaderboard():
	var data = JSON.stringify({
		"username": player_username,
		"timer_seconds": timer_seconds
	})
	
	print(data)
	
	var err
	
	err = http.connect_to_host(base_url, port) # Connect to host/port.
	assert(err == OK) # Make sure connection is OK.

	# Wait until resolved and connected.
	while http.get_status() == HTTPClient.STATUS_CONNECTING or http.get_status() == HTTPClient.STATUS_RESOLVING:
		http.poll()
		await get_tree().process_frame
	
	assert(http.get_status() == HTTPClient.STATUS_CONNECTED)
	
	err = http.request(HTTPClient.METHOD_POST, api_url, ["Content-Type: application/json"], data)
	
	assert(err == OK) # Make sure all is OK.
	print("OK")
	while http.get_status() == HTTPClient.STATUS_REQUESTING:
		# Keep polling for as long as the request is being processed.
		http.poll()
		await get_tree().process_frame

	assert(http.get_status() == HTTPClient.STATUS_BODY or http.get_status() == HTTPClient.STATUS_CONNECTED) # Make sure request finished well.
