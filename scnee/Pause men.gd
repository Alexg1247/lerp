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
