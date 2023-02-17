extends Modchart

func _ready():
	Conductor.connect("beat_hit", beat_hit)
func process(delta):
	#thanks ChatGPT for converting the lua to gdscirpt
	var currentBeat = (Conductor.position / 1000) * (Conductor.bpm / 84)
	if Conductor.curStep >= 789 and Conductor.curStep < 923:
		for i in range(0, 9):
			playerstrums.get_node("key" + str(i)).position.y = playerstrums.get_node("key" + str(i)).position.y + 5 * sin((currentBeat + i * 0.25) * PI)
	if Conductor.curStep >= 924 and Conductor.curStep < 1048:
		for i in range(0, 9):
			playerstrums.get_node("key" + str(i)).position.y = playerstrums.get_node("key" + str(i)).position.y + 5 * sin((currentBeat + i * 0.25) * PI)
	if Conductor.curStep >= 1049 and Conductor.curStep < 1176:
		for i in range(0, 9):
			playerstrums.get_node("key" + str(i)).position.y = playerstrums.get_node("key" + str(i)).position.y + 5 * sin((currentBeat + i * 0.25) * PI)
	if Conductor.curStep >= 1177 and Conductor.curStep < 1959:
		for i in range(0, 9):
			playerstrums.get_node("key" + str(i)).position.y = playerstrums.get_node("key" + str(i)).position.y + 5 * sin((currentBeat + i * 0.25) * PI)
#	if Conductor.cur_step >= 760 and Conductor.cur_step < 786:
#		tween_camera_zoom(1.2, 0.5)
#	if Conductor.cur_step >= 1392 and Conductor.cur_step < 1428:
#		tween_camera_zoom(1.2, 0.5)


			
func beat_hit():
	#print(Conductor.cur_beat)
	match(Conductor.cur_beat):
		189:
			thefuckingpsychenginecameraflashtrademark(Color(0,0,0,1), 2.0)
		190:
			thefuckingpsychenginecameraflashtrademark(Color(1,0,0,1), 4.5)
		195:thefuckingpsychenginecameraflashtrademark(Color(1,0,0,1), 0.5)
