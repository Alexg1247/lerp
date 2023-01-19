extends CanvasLayer

signal dismissedpopup
signal acceptedpopup
signal wentomainmenu

func popup(errortype:int, errormessage:String, backbuttonshow:bool, showcancelbutton:bool, showok:bool):
	$"Buttons/fuck no go back".visible = false
	$Buttons/calcel.visible = false
	match errortype:
		1:
			$Text/AlertTitle.text = "Warning!"
		2:
			$Text/AlertTitle.text = "Alert!"
		3:
			if randi_range(0, 100) == 73:
				$Text/AlertTitle.text = "Whats occured another fatal error?"
			else:
				$Text/AlertTitle.text = "An Error Has Occured."
	$Text/AlertMessage.text = errormessage
	if backbuttonshow:
		$"Buttons/fuck no go back".visible = true
	if showok:
		$Buttons/ok.visible = true
	if showcancelbutton:
		$Buttons/calcel.visible = true
	
	self.visible = true
	get_tree().paused = true

func cancelpopup():
	self.visible = false
	get_tree().paused = false

func _on_ok_pressed():
	cancelpopup()
	acceptedpopup.emit()


func _on_calcel_pressed():
	cancelpopup()
	dismissedpopup.emit()


func _on_fuck_no_go_back_pressed():
	AudioHandler.stopmusic()
	get_tree().change_scene_to_file("res://scnee/Main Menu.tscn")
