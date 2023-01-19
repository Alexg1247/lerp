extends Modchart

var most_recent_is_player: bool = true
var gf_left: bool = false

func _ready() -> void:
	Globals.player_note_hit.connect(player_note_hit)
	Conductor.beat_hit.connect(beat_hit)
	fpstext.get_node("Label").get("label_settings").font = load("res://assets/songs/redux guns/vcr.ttf")
	gameplay.get_node("Backgrounds").visible = false
	gameplay.get_node("Label2").visible = false

func _process(delta: float) -> void:
	if playerstrums == null:
		queue_free()
	else:
		for i in playerstrums.get_child_count():
			var child = playerstrums.get_child(i)
			child.position = lerp(child.position, Vector2(child.position.x, sin(Conductor.position / 100) * 50 * ((clamp(i+2,2,4))) / 4), delta * 11)
	
	if ui != null:
		ui.get_node("Label TO Show if ur good or not").visible = false
		ui.get_node("Giid").visible = false
		ui.get_node("Miss").visible = false
	
	if Conductor.position > 0:
		$captain.position = lerp($captain.position, Vector2(200, 400), delta * 3)
		$bf.position = lerp($bf.position, Vector2(900, 435), delta * 3)
		
		$"ui/plr-icon".scale = lerp($"ui/plr-icon".scale, Vector2(1, 1), delta * 9)
		$"ui/opp-icon".scale = lerp($"ui/opp-icon".scale, Vector2(-1, 1), delta * 9)
	
	$"ui/score-text".text = "Notes Hit:%d - Misses:%d" % [Globals.notes_hit, Globals.misses]
	
	if not Globals.save.grab("downscroll"):
		$"ui/score-text".position.y = 598
		$"ui/plr-icon".position.y = 498
		$"ui/opp-icon".position.y = 498
	else:
		$"ui/score-text".position.y = 100
		$"ui/plr-icon".position.y = 0
		$"ui/opp-icon".position.y = 0
	
	if gf_left and $gf.frame >= 15:
		$gf.playing = false
	

func player_note_hit(hit, hit_data, hit_name):
	playerstrums.get_child(abs(hit_data) % 4).position += Vector2(0, 15)
	most_recent_is_player = hit.is_player
	
	if most_recent_is_player:
		$bf_anim.play(str(hit_data))
		$bf.frame = 0
	else:
		$captain_anim.play(str(hit_data))
		$captain.frame = 0
	
	if most_recent_is_player:
		camera.position = Vector2(576, 324) + Vector2(100, 0)
	else:
		camera.position = Vector2(576, 324) + Vector2(-100, 0)
	
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

func beat_hit():
	if Conductor.cur_beat % 2 == 0:
		if $captain.frame >= $captain.frames.get_frame_count($captain.animation) - 1:
			$captain_anim.play('idle')
			$captain.frame = 0
		if $bf.frame >= $bf.frames.get_frame_count($bf.animation) - 1:
			$bf_anim.play('idle')
			$bf.frame = 0
	
	gf_left = not gf_left
	
	if gf_left:
		$gf.play('GF Dancing Beat Bat')
		$gf.frame = 0
	else:
		$gf.play('GF Dancing Beat Bat')
		$gf.frame = 15
	
	if most_recent_is_player:
		camera.position = Vector2(576, 324) + Vector2(100, 0)
	else:
		camera.position = Vector2(576, 324) + Vector2(-100, 0)
	
	$"ui/plr-icon".scale += Vector2(0.2, 0.2)
	$"ui/opp-icon".scale += Vector2(-0.2, 0.2)
