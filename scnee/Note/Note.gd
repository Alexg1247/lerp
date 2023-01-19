extends Node2D

class_name Note

var strum_y:float = 0.0
var strum_time:float
var note_data:int
var direction:int

var is_player:bool
var is_sustain:bool
var sustain_length:float

var being_pressed:bool = false
var been_hit:bool = false
var og_sustain_length:float = 0.0

var strum = Node2D.new()

@onready var player_strums = get_node("../../strumline")
@onready var enemy_strums = get_node("../../strumline")
var should_hit = true

@onready var line_2d:Line2D = $Line2D

var scroll_speed = 1.0

var time_held: float = 0.0

func _ready():
	match(note_data):
		0:
			strum.position.x = 388
			direction = 0
			pass
		1:
			strum.position.x = 488
			$default.rotate(deg_to_rad(-90))
			direction = 1
		2:
			strum.position.x = 588
			$default.rotate(deg_to_rad(90))
			direction = 2
		3:
			strum.position.x = 688
			$default.rotate(deg_to_rad(180))
			direction = 3
	#scale = Vector2(0.5, 0.5)
	#if Globals.save.grab("guants") == Globals.save.grab("custom_note_color_per_song"):
	#	WarningScreen.popup(1, "Hey! Turn off 'Quants' or 'custom_note_color_per_song' because you cant do both at the same time dummy.", true, false, false)
	if Globals.save.grab("quants"):
		$default.modulate = Color(randf(), randf(), randf(),1)
	
	if Globals.fun:
		$default.modulate = Color(0.02,0.03,0.43,1)
		#print($Line2D.gradient.colors[1])
		#print($Line2D.gradient.get_colors())
		$Line2D.gradient.set_colors([Color(1, 1, 1, 1), Color(0.02,0.03,0.43,1)]) 
		
	else:
		$default.modulate = Color(1, 0, 0, 1)
		$Line2D.gradient.set_colors([Color(1, 1, 1, 1), Color(1, 0, 0, 1)]) 

func _process(delta):
	if Globals.save.grab("downscroll"):
		if position.y >= 500:
			queue_free()
			Globals.misses += 1
	else:
		if position.y <= -500:
			queue_free()
			Globals.misses += 1
	if strum == null:
		if is_player:
			strum = player_strums.get_child(note_data)
		else:
			strum = enemy_strums.get_child(note_data)
	var multiplier:float = 1
	if is_sustain:
		if being_pressed:
			
			sustain_length -= (delta * 1000.0)
			
			var anim_val = 0.15

			if !is_player:
				
				var good: bool = false
				
				if time_held >= 0.15:
					good = true
					time_held = 0
				
				if good:
					$default.animation = "default"
					
					
					#if should_hit:
					#	$AnimatedSprite2D.animation("hit arrow", true)
					#else:
					#d	$AnimatedSprite2D.animation("hit arrow", true)
		
		var y_pos = (((sustain_length / 1.5) * Globals.scroll_speed) / scale.y)
		
		#thx raf and leather for making downscripol wok
		if Globals.save.grab("downscroll"):
			line_2d.set_point_position(0, Vector2(0, float((y_pos * -multiplier) + (sustain_length)))) 
		else:
			line_2d.set_point_position(0, Vector2(0, float((y_pos * multiplier) + (sustain_length)))) 
		if sustain_length <= 0:
			queue_free()
		else:
			time_held += delta * Globals.song_multiplier
			#update()
	
	if Globals.save.grab("downscroll"):
		strum_y = strum.global_position.y + 500
	else:
		strum_y = strum.global_position.y + 100
	modulate.a = strum.modulate.a
	global_position.x = strum.global_position.x
	
	if !being_pressed:
		if Globals.save.grab("downscroll"):
			global_position.y = strum_y - ((-0.45 * (Conductor.position - strum_time) * Globals.scroll_speed) * multiplier)
		else:
			global_position.y = strum_y - ((0.45 * (Conductor.position - strum_time) * Globals.scroll_speed) * multiplier)
	else:
		global_position.y = strum_y
	
	if global_position.y > -100 and global_position.y < 820:
		visible = true
	else:
		visible = false
	visible = true
	#y_pos -= held_sprites[dir_to_string][1].get_height()
