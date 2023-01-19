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
		
	return self

func grab(obj:String):
	if data.has(obj):
		return data[obj]
		
	return null
	
func assign(obj:String, value:Variant):
	data[obj] = value
	
func flush():
	var json_path:String = folder_path+folder+"/"+json+".json"
	var file = FileAccess.open(json_path, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(data))

