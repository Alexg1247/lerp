extends Control


var mobile = Globals.mobile
# Called when the node enters the scene tree for the first time
var songlist = Globals.songlist
var currentsong = 0

var lerped = true
# Called when the node enters the scene tree for the first time.
func _ready():
	AudioHandler.stopmusic()
	if get_parent().get_node("modchart"):
		get_parent().get_node("modchart").queue_free()
	#print(OS.get_name())
	match OS.get_name():
		"Android":
			$Options/CheckButton.button_pressed = true
		"Windows":
			print("L\nL\nL\nL\nL\nL\nL\nL\nL\nL\nL\nL\nL\nL\nL\nL\n")
			#renable that later!!!! also L
#			AudioHandler.get_node("SFX").stream = load("res://assets/songs but better/L.wav")
#			AudioHandler.get_node("SFX").volume_db = clamp(linear_to_db(Globals.volume / 2), -100, 99999)
#			AudioHandler.get_node("SFX").play()
	for String in songlist:
		addsong(String, "Default Songs")
	if Globals.save.grab("mobile_controls"):
		$Options/CheckButton.button_pressed = true
	else:
		$Options/CheckButton.button_pressed = false
	
	if Globals.save.grab("custom_note_color_per_song"):
		$Options/CheckButton5.button_pressed = true
	else:
		$Options/CheckButton5.button_pressed = false
	
	if Globals.save.grab("downscroll"):
		$Options/CheckButton2.button_pressed = true
	else:
		$Options/CheckButton2.button_pressed = false
	
	if Globals.save.grab("quants"):
		$Options/CheckButton4.button_pressed = true
	else:
		$Options/CheckButton4.button_pressed = false
	if Globals.save.grab("vsync"):
		$Options/CheckButton3.button_pressed = true
	else:
		$Options/CheckButton3.button_pressed = false
	if Globals.save.grab("sdkl"):
		$Options/CheckButton5.button_pressed = true
	else:
		$Options/CheckButton5.button_pressed = false
	var template = load("res://scnee/TemplateSong.tscn").instantiate()
	$"ScrollContainer/VBoxContainer".add_child(template)
	Globals.fun = false
	
func addsong(songname, category):
	var template = load("res://scnee/TemplateSong.tscn").instantiate()
	$"ScrollContainer/VBoxContainer".add_child(template)
			
	template.songname = songlist[currentsong]
	var score = Globals.scoredata.grab(template.songname)
	template.get_node("Label").text = songlist[currentsong]
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

func mobile_controls():
	Globals.save.assign("mobile_controls", !Globals.save.grab("mobile_controls")) 
	Globals.save.flush()
	#Options.saveshit(Options.options)


func downscroll():
	Globals.save.assign("downscroll", !Globals.save.grab("downscroll")) 
	Globals.save.flush()


func vsync():
	Globals.save.assign("vsync", !Globals.save.grab("vsync")) 
	Globals.save.flush()
	
	Globals.save.flush()
	if Globals.save.grab("vsync"):
		DisplayServer.window_set_vsync_mode(1)
	else:
		DisplayServer.window_set_vsync_mode(0)


func quants():
	Globals.save.assign("quants", !Globals.save.grab("quants")) 
	Globals.save.flush()


func _on_button_2_pressed():
	get_tree().change_scene_to_packed(load("res://scnee/crrdit mnu.tscn"))


func _on_check_button_5_pressed():
	Globals.save.assign("sdkl", !Globals.save.grab("sdkl")) 
	Globals.save.flush()
