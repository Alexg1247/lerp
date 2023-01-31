extends Node2D

#the song that you are playing
var song = Globals.currentsong

#the notes
var noteDataArray = []

#template note
var template_note:Node2D 

#idk
var template_notes:Dictionary = {}

#the strumlines fr
@onready var player_strums = $"UI/STRUM2/strumline"

#omg notes!!!?!?!?!
@onready var player_notes = $"UI/STRUM2/Player Note"


func _ready(): 
	#variables iguess
	var inst
	var bg
	var backgroundnode
	var f
	#checks if your song is modded
	if Globals.ismodded:
		#this loads all the shit to play: the chart, bg, inst and also them modchart
		f = FileAccess.open("res://mods/songs/"+song+ "/" + song + ".json", FileAccess.READ)
		inst = load(str("res://mods/songs/" + song + "/" + CoolUtil.findsong("res://mods/songs/"+song, false)))
		bg = load("res://mods/songs/" + song + "/" + CoolUtil.getdaimagethingy("res://mods/songs/" + song, song))
		backgroundnode = get_node("Backgrounds")
		if ResourceLoader.exists("res://assets/songs/"+song+ "/modchart.tscn"):
			var modchart = load("res://assets/songs/"+song+ "/modchart.tscn").instantiate()
			get_node("/root/").add_child(modchart)
		backgroundnode.texture = bg
		#bg scaling that ima add later hopefully
		match song:
			"fatality":
				backgroundnode.scale = Vector2(2,2)
			"cys good":
				backgroundnode.scale = Vector2(1, 1)
			"toggogl downwall":
				backgroundnode.scale = Vector2(1.24,1.24)
				#backgroundnode.position.y -= 30
			"lost my mind":
				backgroundnode.scale = Vector2(0.75, 0.75)
			"phantasm":
				backgroundnode.scale = Vector2(0.75, 0.75)
			"triple-trouble-brodo":
				backgroundnode.scale = Vector2(1.1, 1.1)
	else:
		#this does all the shit from above but like for not modded songs
		f = FileAccess.open("res://assets/songs/"+song+ "/" + song + ".json", FileAccess.READ)
		inst = load(str("res://assets/songs/" + song + "/" + CoolUtil.findsong("res://assets/songs/"+song, false)))
		bg = load("res://assets/songs/" + song + "/" + CoolUtil.getdaimagethingy("res://assets/songs/" + song, song))
		backgroundnode = get_node("Backgrounds")
		backgroundnode.texture = bg
		if ResourceLoader.exists("res://assets/songs/"+song+ "/modchart.tscn"):
			var modchart = load("res://assets/songs/"+song+ "/modchart.tscn").instantiate()
			get_node("/root/").add_child(modchart)
		match song:
			"fatality":
				backgroundnode.scale = Vector2(2,2)
			"cys good":
				backgroundnode.scale = Vector2(1, 1)
			"toggogl downwall":
				backgroundnode.scale = Vector2(1.24,1.24)
				#backgroundnode.position.y -= 30
			"lost my mind":
				backgroundnode.scale = Vector2(0.75, 0.75)
			"phantasm":
				backgroundnode.scale = Vector2(0.75, 0.75)
			"triple-trouble-brodo":
				backgroundnode.scale = Vector2(1.1, 1.1)
	#configure audio
	AudioHandler.get_node("Songs/Inst").stream = inst
	AudioHandler.get_node("Songs/Inst").volume_db = clamp(linear_to_db(Globals.volume / 2), -100, 99999)
	AudioHandler.get_node("Songs/Inst").connect("finished", songfinished)
	
	#keybinds UwU
	var content:String = "{}"
	var chartData:Dictionary = {}
	if Globals.save.grab("sdkl"):
		Globals.save.load_binds(["S", "D", "K", "L"])
	else:
		Globals.save.load_binds(["D", "F", "J", "K"])
	
	#i dont know
	if f:
		content = f.get_as_text()
		var json = JSON.new()
		json.parse(content)
		chartData = json.data.song
		
	else:
		print("die")
	#sets the shit to 0 for the song
	Globals.misses = 0
	Globals.notes_hit = 0
	Conductor.cur_beat = 0
	Conductor.cur_step = 0
	Conductor.change_bpm(float(chartData["bpm"]))
	Conductor.position = -Conductor.crochet * 4
	#print(Conductor.position)
	Conductor.connect("beat_hit", beat_hit)
	template_notes["default"] = preload("res://scnee/Note/Note.tscn").instantiate()
	#note shit i guess
	for section in chartData["notes"]:
		for note in section["sectionNotes"]:
			if note[1] != -1:
				if len(note) == 3:
					note.push_back(0)
				
				var type:String = "default"
				
				if note[3] is Array:
					note[3] = note[3][0]
				elif note[3] is String:
					type = note[3]
					
					note[3] = 0
					note.push_back(type)
				
				if len(note) == 4:
					note.push_back("default")
				
				if note[4]:
					if note[4] is String:
						type = note[4]
						
						if not type in template_notes:
							var loaded_note = preload("res://scnee/Note/Note.tscn")
							
							if loaded_note != null:
								template_notes[type] = loaded_note.instantiate()
							else:
								template_notes[type] = template_notes["default"]
				
				if not "altAnim" in section:
					section["altAnim"] = false
				
				if not note[3]:
					note[3] = 0
				
				noteDataArray.push_back([float(note[0]) + (AudioServer.get_output_latency() * 1000), note[1], note[2], bool(section["mustHitSection"]), int(note[3]), type, bool(section["altAnim"])])
#			else:
#				if len(note) >= 5:
#					events_to_do.append([note[2], float(note[0]), note[3], note[4]])

	noteDataArray.sort_custom(note_sort)

func note_sort(a, b):
	return a[0] < b[0]

func beat_hit():
	if Conductor.cur_beat % 4 == 0:
		$Camera.zoom += Vector2(0.05, 0.05)
	
	pass
#song finished :)
func songfinished():
	print("song finished :)")
	var score = $"UI/Label TO Show if ur good or not".text
	if !Globals.save.grab("botplay"):
		Globals.scoredata.assign(song, score) 
		Globals.scoredata.flush()
	get_tree().change_scene_to_file("res://scnee/Main Menu.tscn")
	AudioHandler.stopmusic()

func  _physics_process(delta):
	var index = 0
	for note in noteDataArray:
		if float(note[0]) > Conductor.position + (2500):
			break
		
		var is_player_note = true
		var should_spawn = true
			
		if note[3] and int(note[1]) % 8 >= 4:
			is_player_note = false
		elif !note[3] and int(note[1]) % 8 <= 3:
			is_player_note = false
			
			# cool thing lmao make this an option later :skull:
		if int(note[1]) > 3:
			should_spawn = false
		#we need themovie
		#real
		#the movie ever
		if float(note[0]) < Conductor.position + (2500) and should_spawn:
			var new_note = template_notes["default"].duplicate()
			new_note.strum_time = float(note[0])
			new_note.note_data = int(note[1])
			new_note.direction = player_strums.get_child(new_note.note_data % 4).keynumber
			new_note.visible = true

			if int(note[4]) != null:
				if "character" in new_note:
					new_note.character = note[4]
			
			if float(note[2]) >= Conductor.step_crochet:
				new_note.is_sustain = true
				new_note.sustain_length = float(note[2])
			new_note.position.x = player_strums.get_child(new_note.note_data % 4).global_position.x 
			player_notes.add_child(new_note)
			
			new_note.is_player = is_player_note
			if Globals.save.grab("downscroll"):
				new_note.global_position.y = -5000
			else:
				new_note.global_position.y = 5000
			
			noteDataArray.remove_at(index)
			
			index += 1
#counter
var counter:int

func _process(delta):
	Conductor.position += delta * 1000
	
	if Conductor.position >= 0 and not AudioHandler.get_node("Songs/Inst").playing:
		AudioHandler.get_node("Songs/Inst").play()
		Conductor.position = 0
	
	if AudioHandler.get_node("Songs/Inst").playing and abs(Conductor.position - (AudioHandler.get_node("Songs/Inst").get_playback_position() * 1000.0)) >= 75:
		Conductor.position = AudioHandler.get_node("Songs/Inst").get_playback_position() * 1000.0
	
	if Conductor.cur_beat >= 0: counter = 4
		# increment counter every beat basically (used to be -4.0 + counter but that no work ig so ae)
	elif Conductor.cur_beat >= -3.0 + counter: counter += 1
	
	$Camera.zoom = lerp($Camera.zoom, Vector2(1, 1), delta * 9)
	
	
	
