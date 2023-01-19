extends Node2D

var key_count = 4
@onready var player_notes = get_node("../Player Note")

var key = preload("res://scnee/key.tscn").instantiate()
var key2 = preload("res://scnee/key.tscn").instantiate()
var key3 = preload("res://scnee/key.tscn").instantiate()
var key4 = preload("res://scnee/key.tscn").instantiate()

func _ready():
	key.scale = Vector2(0.5, 0.5)
	add_child(key)
	
	key2.scale = Vector2(0.5, 0.5)
	key2.keynumber = 1
	key2.position.x = 100
	add_child(key2)
	
	key3.scale = Vector2(0.5, 0.5)
	key3.keynumber = 2
	key3.position.x = 200
	add_child(key3)
	
	key4.scale = Vector2(0.5, 0.5)
	key4.keynumber = 3
	key4.position.x = 300
	add_child(key4)

func _process(delta):
	for index in key_count:
		var input_string:String = "gameplay_" + str(index)
		var strum = get_child(index)
		
		if Input.is_action_just_pressed(input_string):
			
			var time:float = 0.0
			
			var can_hit:Array = []
			
			var lowest_strum:float = INF
			var hit:Node2D = null
			for note in player_notes.get_children():
				if note.note_data == index and (not "been_hit" in note or !note.been_hit):
					if note.strum_time > Conductor.position - (Conductor.safe_zone_offset ) and note.strum_time < Conductor.position + (Conductor.safe_zone_offset):
						can_hit.append(note)
			
			for note in can_hit:
				if note.strum_time - Conductor.position <= lowest_strum:
					lowest_strum = note.strum_time - Conductor.position
					hit = note
			

			
			if hit != null:
				if not "should_hit" in hit:
					hit.should_hit = true
				
				time = hit.strum_time
				
				#hit.note_hit()
				
				Globals.emit_signal("player_note_hit", hit, hit.note_data, hit.name)
				#Globals.emit_signal("note_hit", hit, hit.note_data, hit.name, true)
				
				if !hit.is_sustain:
					Globals.notes_hit += 1
					hit.queue_free()
				else:
					Globals.notes_hit += 1
					hit.being_pressed = true
					
					if 'been_hit' in hit:
						hit.been_hit = true
				
				hit.sustain_length -= Conductor.position - hit.strum_time


			
			for note in player_notes.get_children():
				if note.note_data == index:
					if note.strum_time == time and note != hit:
						if !note.is_sustain:
							#note.note_hit()
							Globals.notes_hit += 1
							note.queue_free()
						else:
							Globals.notes_hit += 1
							note.being_pressed = true
					
							if 'been_hit' in note:
								note.been_hit = true
