extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	if Globals.save.grab("downscroll"):
		$"Label TO Show if ur good or not".position.y = 0
		$"Label TO Show if ur good or not".vertical_alignment = 0
	else:
		$"Label TO Show if ur good or not".vertical_alignment = 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Giid.text = "Notes Hit: " + str(Globals.notes_hit)
	$Miss.text = "Misses: " + str(Globals.misses)
	$"Label TO Show if ur good or not".text = Globals.comboname

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
		
