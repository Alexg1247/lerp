extends Node2D

var key_count = 4
#@onready var player_notes = get_node("../Player Note")
@onready var enemy_notes = get_node("../OppNote")

var key = preload("res://scnee/enemy key.tscn").instantiate()
var key2 = preload("res://scnee/enemy key.tscn").instantiate()
var key3 = preload("res://scnee/enemy key.tscn").instantiate()
var key4 = preload("res://scnee/enemy key.tscn").instantiate()

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
		#var input_string:String = "gameplay_" + str(index)
		var strum = get_child(index)
		
		
			
		var time:float = 0.0
		
		var can_hit:Array = []
		
		var lowest_strum:float = INF
		var hit:Node2D = null
		for note in enemy_notes.get_children():
			if note.strum_time > Conductor.position:
				continue
		
			if note.should_hit and !note.being_pressed:
				
				Globals.emit_signal("enemy_note_hit", hit, true)
				
				#note.note_hit()
				
		
		for note in can_hit:
			if note.strum_time - Conductor.position <= lowest_strum:
				lowest_strum = note.strum_time - Conductor.position
				hit = note
			

			
			if hit != null:
				if not "should_hit" in hit:
					hit.should_hit = true
				
				time = hit.strum_time
				
				#hit.note_hit()
				
				#Globals.emit_signal("player_note_hit", hit, hit.note_data, hit.name)
				Globals.emit_signal("enemy_note_hit", hit, true)
				
				if !hit.is_sustain:
					hit.queue_free()
				else:
					hit.being_pressed = true
					
					if 'been_hit' in hit:
						hit.been_hit = true
				
				hit.sustain_length -= Conductor.position - hit.strum_time
				
			

			
	
				
