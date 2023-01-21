extends Node2D

@export_range(0,3) var keynumber:int = 0
var direction

func _ready():
	match(keynumber):
		0:
			pass
			direction = "left"
		1:
			rotate(deg_to_rad(-90))
			direction = "down"
		2:
			rotate(deg_to_rad(90))
			direction = "up"
		3:
			rotate(deg_to_rad(180))
			direction = "right"
	#position.y = -128
	
func _process(delta):
	if !Globals.save.grab("botplay"):
		if Input.is_action_pressed("gameplay_" + str(keynumber)):
			$key.frame = 0
		if !Input.is_action_pressed("gameplay_" + str(keynumber)):
			$key.frame = 1

