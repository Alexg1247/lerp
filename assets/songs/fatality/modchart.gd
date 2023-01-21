extends Node2D

var counter= 0

var window = load("res://assets/songs/fatality/thewindowthing.tscn").instantiate()
# Called when the node enters the scene tree for the first time.
func _ready():
	counter = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	counter += randi_range(0, 1)
	print(counter)
	if counter >= 700:
		counter = 0
		makewindow()

func makewindow():
	var window2 = window.duplicate()
	
	print("thicc thighs")
	self.add_child(window2)
	window2.position = Vector2(randi_range(0, 1000), randi_range(0, 700))
