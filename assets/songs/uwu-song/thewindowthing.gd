extends Window


func _ready():
	get_tree().create_timer(randi_range(5, 45)).connect("timeout", die)

func _on_button_pressed():
	die()
	

func die():
	Globals.totalwindows -= 1
	self.queue_free()
