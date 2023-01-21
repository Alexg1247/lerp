extends Window

func _on_button_pressed():
	self.queue_free()
	Globals.totalwindows -= 1
