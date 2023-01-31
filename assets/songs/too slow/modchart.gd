extends Modchart

func _ready():
	Conductor.connect("beat_hit", beat_hit)

func beat_hit():
	#print(Conductor.cur_beat)
	match(Conductor.cur_beat):
		189:
			thefuckingpsychenginecameraflashtrademark(Color(0,0,0,1), 2.0)
		190:
			thefuckingpsychenginecameraflashtrademark(Color(1,0,0,1), 4.5)
		195:thefuckingpsychenginecameraflashtrademark(Color(1,0,0,1), 0.5)
