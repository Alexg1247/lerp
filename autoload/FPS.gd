extends CanvasLayer

var volume = Globals.save.grab("volume")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	AudioHandler.get_node("Songs/Inst").volume_db = volume
func _process(delta):
	if Globals.fun:
		$Label.text = "FUN IS INFINITEfps" + "\n" + str((CoolUtil.get_vram_usage() / 1048576)).pad_decimals(2) + "mb vram"
		$Volume/Volume.text = str(volume)
	else:
		$Label.text = "%dfps" % Engine.get_frames_per_second() + "\n%smb vram" % str((CoolUtil.get_vram_usage() / 1048576)).pad_decimals(2)
		$Volume/Volume.text = str(volume)

func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		if !get_tree().current_scene.name == "Main Menu":
			pause()
	
	if Input.is_action_just_pressed("volume_down"):
		volume = volume - 0.5
		AudioHandler.get_node("Songs/Inst").volume_db = volume
		showthingy()
		Globals.save.assign("volume", volume)
		Globals.save.flush() 
	
	if Input.is_action_just_pressed("volume_up"):
		volume = volume + 0.5
		AudioHandler.get_node("Songs/Inst").volume_db = volume
		showthingy()
		Globals.save.assign("volume", volume)
		Globals.save.flush() 

func pause():
	get_tree().paused = !get_tree().paused
	PauseMenu.visible = get_tree().paused

func showthingy():
	var tween = $Volume.create_tween()
	tween.tween_property($Volume, "position", Vector2(782, 0), 0.4)
	await get_tree().create_timer(3.5).timeout
	if !Input.is_action_just_pressed("volume_down") or !Input.is_action_just_pressed("volume_up"):
		var tween2 = $Volume.create_tween()
		tween2.tween_property($Volume, "position", Vector2(1165, 0), 0.4)
