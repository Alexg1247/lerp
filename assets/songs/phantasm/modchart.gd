extends Modchart

func _ready() -> void:
	Globals.player_note_hit.connect(player_note_hit)
	Conductor.connect("beat_hit", beat_hit)

#the camera script lmao it buggy af
func player_note_hit(hit, hit_data, hit_name):
	$bf_anim.play(str(hit_data))
	$bf.frame = 0
	camera.position = Vector2(576, 384)
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
#epic modchart
func beat_hit():
	if Conductor.cur_beat % 8 == 0:
		thefuckingpsychenginecameraflashtrademark()
	if Conductor.cur_beat % 2 == 0:
		if $bf.frame >= $bf.frames.get_frame_count($bf.animation) - 1:
			$bf_anim.play('idle')
			$bf.frame = 0
