extends Node

#swordcube made this. thanks!
func playmusic(node:String, volume:float = 1.0, _time:float = 1.0):
	var n:AudioStreamPlayer = get_node(node)
	if n != null:
		n.play()
		n.volume_db = clamp(linear_to_db(volume), -100, 99999)
		
		
func stopmusic():
	for n in $"/root/AudioHandler/Songs".get_children():
		if n != null:
			n.stop()
			
func playSound(node:String, _time:float = 1.0, volume:float = 1.0):
	var n:AudioStreamPlayer = get_node("sounds/" + node)
	if n != null:
		var dupe = n.duplicate()
		dupe.play()
		dupe.volume_db = clamp(linear_to_db(volume), -100, 99999)
		get_tree().current_scene.add_child(dupe)
