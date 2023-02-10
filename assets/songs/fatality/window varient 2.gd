extends Node2D

var allowedclosing = false

func _on_button_pressed():
	if allowedclosing:
		self.queue_free()
		Globals.totalwindows -= 1


func _on_check_box_pressed():
	allowedclosing = !allowedclosing
