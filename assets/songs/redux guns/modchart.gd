extends Modchart

func _ready() -> void:
	Globals.player_note_hit.connect(player_note_hit)
	Conductor.beat_hit.connect(beat_hit)
	fpstext.get_node("Label").get("label_settings").font = load("res://assets/songs/redux guns/vcr.ttf")

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
		$captain.position = lerp($captain.position, Vector2(300, 400), delta * 3)
		$bf.position = lerp($bf.position, Vector2(852, 435), delta * 3)
		
		$"plr-icon".scale = lerp($"plr-icon".scale, Vector2(1, 1), delta * 9)
		$"opp-icon".scale = lerp($"opp-icon".scale, Vector2(-1, 1), delta * 9)
	
	$"score-text".text = "Notes Hit:%d - Misses:%d" % [Globals.notes_hit, Globals.misses]

func player_note_hit(hit, hit_data, hit_name):
	playerstrums.get_child(abs(hit_data) % 4).position += Vector2(0, 15)

func beat_hit():
	if Conductor.cur_beat % 2 == 0:
		$captain.play('idle')
		if $captain.frame == 13:
			$captain.frame = 0
		$bf.play('idle')
		if $bf.frame == 15:
			$bf.frame = 0
	
	$"plr-icon".scale += Vector2(0.2, 0.2)
	$"opp-icon".scale += Vector2(-0.2, 0.2)
