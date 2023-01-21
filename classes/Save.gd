extends Node

class_name Save

var data:Dictionary = {}
var folder:String = ""
var json:String = ""
var folder_path:String = "user://saves/"

func bind(json:String, folder:String):
	self.json = json
	self.folder = folder
	
	DirAccess.make_dir_recursive_absolute(folder_path+folder)
	
	var json_path:String = folder_path+folder+"/"+json+".json"
	
	# godot is amazing!
	if !FileAccess.file_exists(json_path):
		var fuck = FileAccess.open(json_path, FileAccess.WRITE_READ)
		fuck.store_string("{}")
		fuck.flush()
	
	var file = FileAccess.open(json_path, FileAccess.READ)
	if file:
		print("Loaded save json for "+json+" successfully")
		data = CoolUtil.load_json_from_text(file.get_as_text())
		
		if grab("sdkl"):
			load_binds(["S", "D", "K", "L"])
		else:
			load_binds(["D", "F", "J", "K"])
	
	return self

func grab(obj:String):
	if data.has(obj):
		return data[obj]
		
	return null
	
func assign(obj:String, value:Variant):
	data[obj] = value
	
	if obj == "sdkl":
		if value == true:
			load_binds(["S", "D", "K", "L"])
		else:
			load_binds(["D", "F", "J", "K"])
	
func flush():
	var json_path:String = folder_path+folder+"/"+json+".json"
	var file = FileAccess.open(json_path, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(data))

func load_binds(binds) -> void:
	for i in binds.size():
		InputMap.action_erase_events("gameplay_%d" % i)
		
		var key: InputEventKey = InputEventKey.new()
		key.keycode = OS.find_keycode_from_string(binds[i])
		
		InputMap.action_add_event("gameplay_%d" % i, key)
