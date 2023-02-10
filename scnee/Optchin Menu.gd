extends Node2D

var move = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	if Globals.save.grab("mobile_controls"):
		$TabContainer/Gameplay/VBoxContainer/CheckButton.button_pressed = true
	else:
		$TabContainer/Gameplay/VBoxContainer/CheckButton.button_pressed = false
	
	if Globals.save.grab("downscroll"):
		$TabContainer/Gameplay/VBoxContainer/CheckButton2.button_pressed = true
	else:
		$TabContainer/Gameplay/VBoxContainer/CheckButton2.button_pressed = false
	
	if Globals.save.grab("quants"):
		$TabContainer/Visuals/VBoxContainer/CheckButton4.button_pressed = true
	else:
		$TabContainer/Visuals/VBoxContainer/CheckButton4.button_pressed = false
	if Globals.save.grab("vsync"):
		$TabContainer/Gameplay/VBoxContainer/CheckButton3.button_pressed = true
	else:
		$TabContainer/Gameplay/VBoxContainer/CheckButton3.button_pressed = false
	if Globals.save.grab("sdkl"):
		$TabContainer/Gameplay/VBoxContainer/CheckButton5.button_pressed = true
	else:
		$TabContainer/Gameplay/VBoxContainer/CheckButton5.button_pressed = false
	if Globals.save.grab("botplay"):
		$TabContainer/Gameplay/VBoxContainer/CheckButton6.button_pressed = true
	else:
		$TabContainer/Gameplay/VBoxContainer/CheckButton6.button_pressed = false
	if Globals.save.grab("just dont"):
		$"TabContainer/Misc/VBoxContainer/just dont".button_pressed = true
	else:
		$"TabContainer/Misc/VBoxContainer/just dont".button_pressed = false

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !Globals.save.grab("downscroll"):
		$"Normal Notes".position = lerp($"Normal Notes".position, Vector2(337, 100), delta * 3)
	else:
		$"Normal Notes".position = lerp($"Normal Notes".position, Vector2(337, 500), delta * 3)

func vsync():
	Globals.save.assign("vsync", !Globals.save.grab("vsync")) 
	Globals.save.flush()
	
	Globals.save.flush()
	if Globals.save.grab("vsync"):
		DisplayServer.window_set_vsync_mode(1)
	else:
		DisplayServer.window_set_vsync_mode(0)


func quants():
	Globals.save.assign("quants", !Globals.save.grab("quants")) 
	Globals.save.flush()

func _on_check_button_5_pressed():
	Globals.save.assign("sdkl", !Globals.save.grab("sdkl")) 
	Globals.save.flush()


func _on_check_button_2_pressed():
	Globals.save.assign("downscroll", !Globals.save.grab("downscroll")) 
	Globals.save.flush()

func move_da_note():
	print("downscroll on UwU")

func _on_back_pressed() -> void:
	get_tree().change_scene_to_packed(load("res://scnee/Main Menu.tscn"))


func _on_check_button_6_pressed():
	Globals.save.assign("botplay", !Globals.save.grab("botplay")) 
	Globals.save.flush()


func _on_just_dont_pressed():
	Globals.save.assign("just dont", !Globals.save.grab("just dont")) 
	Globals.save.flush()
