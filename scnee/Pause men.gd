extends CanvasLayer

func _ready() -> void:
	if Globals.save.grab("botplay"):
		$HE.visible = true
	else:
		$HE.visible = false
	print("hi pause menu here")

func leave():
	if get_parent().get_node("modchart"):
		get_parent().get_node("modchart").queue_free()
	resume()
	AudioHandler.get_node("Songs/Inst").stop()
	get_tree().change_scene_to_file('res://scnee/Main Menu.tscn')

func resume():
	get_tree().paused = false
	visible = false

func _on_skip_pressed():
	print(float($LineEdit.text) * 1000)
	AudioHandler.get_node("Songs/Inst").play()
	AudioHandler.get_node("Songs/Inst").seek(float($LineEdit.text))
	Conductor.position = float($LineEdit.text) * 1000
	for note in get_tree().get_root().get_node("Node2D/UI/STRUM2/Player Note").get_children():
		if note.strum_time > Conductor.position:
			note.queue_free()
	Globals.skippingtime = true
	resume()
	await get_tree().create_timer(2.0).timeout
	if Globals.skippingtime == true:
		Globals.skippingtime = false
	
