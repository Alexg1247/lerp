extends CanvasLayer
var volume = Globals.volume 
var pasuemen = load("res://scnee/Pause men.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	if Globals.fun:
		$Label.text = "FPS: FUN IS INFINITE" + "\nVRAM: " + str((CoolUtil.get_vram_usage() / 1048576)).pad_decimals(2)
		$Volume/Volume.text = str(volume * 10)
	else:
		$Label.text = "FPS: " + str(Engine.get_frames_per_second()) + "\nVRAM: " + str((CoolUtil.get_vram_usage() / 1048576)).pad_decimals(2)
		$Volume/Volume.text = str(volume * 10)

func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		if !get_tree().current_scene.name == "Main Menu":
			pause()
	
	if Input.is_action_just_pressed("volume_down"):
		volume = volume - 0.5
		AudioHandler.get_node("Songs/Inst").volume_db = volume
		showthingy()
	
	if Input.is_action_just_pressed("volume_up"):
		volume = volume + 0.5
		AudioHandler.get_node("Songs/Inst").volume_db = volume
		showthingy()

func pause():
	get_tree().paused = !get_tree().paused

func _on_button_pressed():
	pause()


func _on_button_2_pressed():
	if !Globals.fun:
		AudioHandler.stopmusic()
		get_tree().change_scene_to_file("res://scnee/Main Menu.tscn")
		pause()
	else:
		$"Pause Men/Button2".visible = false

func showthingy():
	var tween = $Volume.create_tween()
	tween.tween_property($Volume, "position", Vector2(782, 0), 0.4)
	await get_tree().create_timer(3.5).timeout
	if !Input.is_action_just_pressed("volume_down") or !Input.is_action_just_pressed("volume_up"):
		var tween2 = $Volume.create_tween()
		tween2.tween_property($Volume, "position", Vector2(1165, 0), 0.4)
