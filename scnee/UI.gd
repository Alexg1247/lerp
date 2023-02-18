extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	
	if Globals.save.grab("just dont"):
		$Botplay.text = Marshalls.utf8_to_base64("BOTPLAY")
	else:
		$Botplay.text = "BOTPLAY"
	if Globals.save.grab("botplay"):
		$Botplay.visible = true
	else:
		$Botplay.visible = false
	if Globals.save.grab("downscroll"):
		$"Label TO Show if ur good or not".position.y = 0
		$"Label TO Show if ur good or not".vertical_alignment = 0
		$Botplay.position.y = 80
		$Timebar.position.y = 555
	else:
		$Botplay.position.y = 512
		$Timebar.position.y = 70
		$"Label TO Show if ur good or not".vertical_alignment = 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Globals.percent = int(Conductor.position / 1000)
	$Timebar.value = Globals.percent
	$Timebar.max_value = AudioHandler.get_node("Songs/Inst").stream.get_length()
	if Globals.save.grab("just dont"):
		$Giid.text = Marshalls.utf8_to_base64("Notes Hit: " + str(Globals.notes_hit))
		$Miss.text = Marshalls.utf8_to_base64("Misses: " + str(Globals.misses))
		$"Label TO Show if ur good or not".text = Marshalls.utf8_to_base64(Globals.comboname)
	else:
		$Giid.text = "Notes Hit: " + str(Globals.notes_hit)
		$Miss.text = "Misses: " + str(Globals.misses)
		$"Label TO Show if ur good or not".text = Globals.comboname
		$acc.text = "Accuracy: " + str(Globals.accuracy) + "%"

	if Globals.misses == 0:
		if Globals.fun:
			Globals.comboname = "Fun Is Infinite"
		else:
			Globals.comboname = "FC"
	if Globals.misses > 0 and Globals.misses <= 10:
		Globals.comboname = "SDCB"
	if Globals.misses > 10: 
		Globals.comboname = "Clear"
	if Globals.misses == 69:
		Globals.comboname = "Nice ;)"
		
