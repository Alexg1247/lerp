extends Control

var mobile = Globals.mobile
# Called when the node enters the scene tree for the first time
var songlist = Globals.songlist
var currentsong = 0

var lerped = true
# Called when the node enters the scene tree for the first time.
func _ready():
	if Globals.save.grab("just dont"):
		$Label.text = Marshalls.utf8_to_base64($Label.text)
	DisplayServer.window_set_title("lerp(): the rythm game", 0)
	AudioHandler.stopmusic()
	if get_parent().get_node("modchart"):
		get_parent().get_node("modchart").queue_free()
	match OS.get_name():
		"Android":
			$Options/CheckButton.button_pressed = true
		"Windows":
			print("L\nL\nL\nL\nL\nL\nL\nL\nL\nL\nL\nL\nL\nL\nL\nL\n")
	for String in songlist:
		if Globals.save.grab("just dont"):
			addsong(Marshalls.utf8_to_base64(String), "Default Songs")
		else:
			addsong(String, "Default Songs")
	var template = load("res://scnee/TemplateSong.tscn").instantiate()
	$"ScrollContainer/VBoxContainer".add_child(template)
	Globals.fun = false
	
func addsong(songname, category):
	var template = load("res://scnee/TemplateSong.tscn").instantiate()
	$"ScrollContainer/VBoxContainer".add_child(template)
			
	template.songname = songlist[currentsong]
	var score = Globals.scoredata.grab(template.songname)
	template.get_node("Label").text = songname
	if Globals.save.grab("just dont"):
		template.get_node("Label2").text =Marshalls.utf8_to_base64("Score: " + str(score))
	else:
		template.get_node("Label2").text ="Score: " + str(score)
	currentsong += 1

func _on_button_pressed():
	var menu:Node2D = $Options
	var ogpos = Vector2(-291, 128)
	var newpos = Vector2(305, 128)
	if lerped:
		menu.position = lerp(ogpos, newpos, 1000)
	else:
		menu.position = lerp(newpos, ogpos, 1000)
	lerped = !lerped

func _on_button_2_pressed():
	get_tree().change_scene_to_packed(load("res://scnee/crrdit mnu.tscn"))

func _open_options() -> void:
	get_tree().change_scene_to_packed(load("res://scnee/Optchin Menu.tscn"))


func _on_info_pressed():
	pass # Replace with function body.
