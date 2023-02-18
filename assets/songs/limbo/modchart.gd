extends Modchart

var keys = [1,2,3,4,5,6,7,8]

var coderan = false
#180
func _ready():
	$"1".visible = false
	$"2".visible = false
	$"3".visible = false
	$"4".visible = false
	$"5".visible = false
	$"6".visible = false
	$"7".visible = false
	$"8".visible = false

func move1(delta):
	for i in keys:
		var u = i + 1
		if u > 8:
			u = 1
		get_node(str(i)).position = lerp(get_node(str(i)).position, get_node(str(u) + "m").position, delta * 10)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	match Conductor.cur_beat:
		602: # start the madness
			$"1".visible = true
			$"2".visible = true
			$"3".visible = true
			$"4".visible = true
			$"5".visible = true
			$"6".visible = true
			$"7".visible = true
			$"8".visible = true
		604:
			move1(delta * 2)
		607:
			move1(delta * 2)

