extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.notecolour = Color(1, 0, 0, 1)
	Globals.misses = 0
	Globals.notes_hit = 0
	Conductor.cur_beat = 0
	Conductor.cur_step = 0
	Globals.save.assign("volume", Globals.volume)
	Globals.save.flush()
	DisplayServer.window_set_title("Meat Beat Mania v1.0")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	Globals.currentsong = "uwu-song"
	Globals.ismodded = false
	add_child(load("res://node_2d.tscn").instantiate())
	

	
