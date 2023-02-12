extends Window

func _on_button_pressed():

	Globals.totalwindows -= 1
	self.queue_free()
