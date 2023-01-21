extends Node

func save(data):
	var file = FileAccess.open("user://save_game.json", FileAccess.WRITE)
	file.store_string(str(data))
