extends Modchart

var most_recent_is_player: bool = true

var pixel = false

func _ready() -> void:
	Globals.player_note_hit.connect(player_note_hit)
	Conductor.beat_hit.connect(beat_hit)
	
func player_note_hit(hit, hit_data, hit_name):
	#playerstrums.get_child(abs(hit_data) % 4).position += Vector2(0, 15)
	most_recent_is_player = hit.is_player
	
	if most_recent_is_player:
		$pixelbf_anim.play(str(hit_data))
		$pixelbf.frame = 0
		$bf_anim.play(str(hit_data))
		$bf.frame = 0
	else:
		$pixelexe_anim.play(str(hit_data))
		$pixelexe.frame = 0
		$sock_anim.play(str(hit_data))
		$sock.frame = 0
	if pixel:
		if most_recent_is_player:
			camera.position = Vector2(576, 324) + Vector2(100, 0)
		else:
			camera.position = Vector2(576, 324) + Vector2(-100, 0)

func beat_hit():
	if Conductor.cur_beat % 2 == 0:
		if $pixelexe.frame >= $pixelexe.sprite_frames.get_frame_count($pixelexe.animation) - 1:
			$pixelexe_anim.play('idle')
			$pixelexe.frame = 0
		if $sock.frame >= $sock.sprite_frames.get_frame_count($sock.animation) - 1:
			$sock_anim.play('idle')
			$sock.frame = 0
		if $pixelbf.frame >= $pixelbf.sprite_frames.get_frame_count($pixelbf.animation) - 1:
			$pixelbf_anim.play('idle')
			$pixelbf.frame = 0
		if $bf.frame >= $bf.sprite_frames.get_frame_count($bf.animation) - 1:
			$bf_anim.play('idle')
			$bf.frame = 0
	match Conductor.cur_beat:
		131:
			pixel = true
			
			$bf.visible = false
			$sock.visible = false
			$GreenHill.visible = true
			$pixelbf.visible = true
			$pixelexe.visible = true
		196:
			pixel = false
			$bf.visible = true
			$sock.visible = true
			$GreenHill.visible = false
			$pixelbf.visible = false
			$pixelexe.visible = false
			camera.position = Vector2(576, 324)
			
	
