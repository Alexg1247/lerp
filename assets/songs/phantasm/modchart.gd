extends Modchart


func _ready() -> void:
	Globals.player_note_hit.connect(player_note_hit)

func player_note_hit(hit, hit_data, hit_name):
	camera.position = Vector2(576, 324)
	match(hit_data):
		0:
			camera.position.x += -100
			camera.position.y += 0
		1:
			camera.position.x += 0
			camera.position.y += 100
		2:
			camera.position.x += 0
			camera.position.y += -100
		3:
			camera.position.x += 100
			camera.position.y += 0
