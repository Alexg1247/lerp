extends Node

#thank sword cube for coolest utrilitty ever

#func _ready():
#	RenderingServer.set_default_clear_color(Color.BLACK)

func bytes_to_human(bytes:int = 0):
	var size:float = abs(bytes) + 2147483648 if abs(bytes) != bytes else bytes
	var data:int = 0
	var data_types:Array[String] = ["b", "kb", "mb", "gb", "tb", "pb"]
	while size > 1024 && data < data_types.size()-1:
		data += 1
		size /= 1024;
	size = round(size * 100) / 100
	return str(size) + data_types[data]
	
func load_json(path:String) -> Dictionary:
	var e = FileAccess.open(path, FileAccess.READ)
	if e != null:
		var text:String = e.get_as_text()
		var parsed = JSON.new()
		parsed.parse(text)
		return parsed.data
	return {}
	
func list_files_in_dir(path:String) -> PackedStringArray:
	var files:PackedStringArray = []
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()

		while true:
			var file = dir.get_next()
			if file == "": break
			elif not file.begins_with("."):
				files.append(file)

		dir.list_dir_end()
		
	return files
	
func load_json_from_text(text:String) -> Dictionary:
	var parsed = JSON.new()
	parsed.parse(text)
	return parsed.data
	
# only making these becausethese pieces of code are so long
func get_mem_usage():
	return Performance.get_monitor(Performance.MEMORY_STATIC)
	
func get_mem_peak():
	return Performance.get_monitor(Performance.MEMORY_STATIC_MAX)
	
var vram_peak:int = 0
	
func get_vram_usage():
	return Performance.get_monitor(Performance.RENDER_VIDEO_MEM_USED)
	
func get_vram_peak():
	var usage:int = get_vram_usage()
	if usage > vram_peak:
		vram_peak = usage
	return vram_peak
	
# from now on its alex g 1247 making dumbass shit
# thanks leather128 for making audio work on export!!!!!!!!!!!!!!!!!!!!!!!!!!!
func findsong(path, findvoices):
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				if ".import" in file_name:
					file_name = file_name.replace('.import', '')
				
				if ".mp3" in file_name:
					#print("Found MP3 File:" + file_name)
					if "-voices" in file_name and findvoices:
						return file_name
					else:
						return file_name
				elif ".ogg" in file_name:
					if "-voices" in file_name and findvoices:
						return file_name
					else:
						return file_name
				elif ".wav" in file_name:
					if "-voices" in file_name and findvoices:
						return file_name
					else:
						return file_name
			file_name = dir.get_next()
	else:
		print("A fatal error occurred when trying to access the path.")
	
	return null

func getdaimagethingy(path):
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				if ".import" in file_name:
					file_name = file_name.replace('.import', '')
				
				if ".png" in file_name:
					print("png" + file_name)
					return file_name
				elif ".jpg" in file_name:
					print("jpg" + file_name)
					return file_name
			file_name = dir.get_next()
	else:
		print("An fatal error occurred when trying to access the path.")
	
	return null

func getimage2(path, name):
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				if ".import" in file_name:
					file_name = file_name.replace('.import', '')
				if name in file_name:
					if ".png" in file_name:
						print("png" + file_name)
						return file_name
					elif ".jpg" in file_name:
						print("jpg" + file_name)
						return file_name
			file_name = dir.get_next()
	else:
		print("An fatal error occurred when trying to access the path.")
	
	return null
