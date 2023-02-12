extends Control

var mobile = Globals.mobile
# Called when the node enters the scene tree for the first time
var songlist = Globals.songlist
var moddedsonglist = Globals.moddedsonglist
var currentsong = 0
var currentmoddedsong = 0

var randcolor = Color(randi(), randi(),randi(),1)

var colourarray:Array = [
	Color(0.07,0,0.22,1),
	Color(0.09,0.09,0.17,1),
	Color(0.14,0,0.1,1),
	Color(0.13,0.02,0.01,1),
	Color(0.21,0,0.02,1)
]

var lerped = true
# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.misses = 0
	Globals.notes_hit = 0
	Conductor.cur_beat = 0
	Conductor.cur_step = 0
	Globals.save.assign("volume", Globals.volume)
	Globals.save.flush()
	print(Globals.save.grab("volume"))
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
	for String in moddedsonglist:
		if Globals.save.grab("just dont"):
			addsong(Marshalls.utf8_to_base64(String), "Modded Songs", true)
		else:
			addsong(String, "Modded Songs", true)
	var template = load("res://scnee/TemplateSong.tscn").instantiate()
	$"TabContainer/Default Songs/ScrollContainer/VBoxContainer".add_child(template)
	$"TabContainer/Modded Songs/ScrollContainer/VBoxContainer".add_child(template)
	Globals.fun = false
	
func addsong(songname, category, ismodded = false):
	var template = load("res://scnee/TemplateSong.tscn").instantiate()
	if !ismodded:
		$"TabContainer/Default Songs/ScrollContainer/VBoxContainer".add_child(template)
		template.songname = songlist[currentsong]
		currentsong += 1
	else:
		$"TabContainer/Modded Songs/ScrollContainer/VBoxContainer".add_child(template)
		template.songname = moddedsonglist[currentmoddedsong]
		currentmoddedsong += 1
		template.ismodded = true
	template.get_node("Label").text = songname
	if Globals.save.grab("just dont"):
		template.get_node("Label2").text =Marshalls.utf8_to_base64("Score: " + str(Globals.scoredata.grab(template.songname)))
	else:
		template.get_node("Label2").text ="Score: " + str(Globals.scoredata.grab(songname))
	
func _process(delta):
	Conductor.position += delta * 1000
	if Conductor.cur_beat >= 4:
		var tween = get_tree().create_tween()
		tween.tween_property($Control/ColorRect, "color", colourarray[randi_range(0,colourarray.size() - 1)], delta * 10000).set_trans(Tween.TRANS_SINE)
		#print("thicc thighs")
		tween.play()
		Conductor.position = 0
		
	

func _on_button_pressed():
	var tween = get_tree().create_tween()
	if lerped:
		tween.tween_property($"Optchin Menu", "position", Vector2(0,0), 1.5).set_trans(Tween.TRANS_ELASTIC)
	else:
		tween.tween_property($"Optchin Menu", "position", Vector2(0,-875), 1.5).set_trans(Tween.TRANS_ELASTIC)
	tween.play()
	lerped = !lerped

func _on_button_2_pressed():
	get_tree().change_scene_to_packed(load("res://scnee/crrdit mnu.tscn"))

func _open_options() -> void:
	get_tree().change_scene_to_packed(load("res://scnee/Optchin Menu.tscn"))


func _on_info_pressed():
	pass # Replace with function body.
