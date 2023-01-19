extends CanvasLayer

func _ready() -> void:
	print("hi pause menu here")

func leave():
	resume()
	AudioHandler.get_node("Songs/Inst").stop()
	get_tree().change_scene_to_file('res://scnee/Main Menu.tscn')

func resume():
	get_tree().paused = false
	visible = false
