extends Node2D

var counter = 0
var counterbutcooler = 0

var randomasstext = [
	"s͡d͠oh̀f͝u̴iu͠f",
	"Uw͞U i l̛o̕v͠e͟ ͜thi̛g̛hs :)͘",
	"F͞a̢TA̕L͞ ̛E͠r̷OR͟R",
	"A҉ ̷F́ATA͏L҉ ̧E̕ŖROR̨ HAS̡ O̵C̶CU͢RRED ͠",
	"null",
	"Godo͟t͠ E̸ngíne̡ ͞4͘.̕0",
	"le҉r̷p(̢):͠ ͏the̴ ryth̀m̵ ͡g̵a",
	"Friday Night Funkin' Psych Engine",
	"S̵Y̵NT͝AX ̴ER̵R̡OR ̸",
	"Thanks̸ ̢Le͜át͡her̡1̡28̸ ͞fo̧r͠ ̀h͟el̡p̨ing ͏al̵ot w̵ith̨ ̵t͏h͡i̷s͡ st̶up͞id͘ t̡h͜i̸n̕g"
]

var window = load("res://assets/songs/fatality/thewindowthing.tscn").instantiate()
# Called when the node enters the scene tree for the first time.
func _ready():
	counter = 0
	counterbutcooler = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	counter += randi_range(0, 1)
	counterbutcooler += randi_range(0, 1)
	if counterbutcooler >= 300 and Conductor.cur_beat >= 64:
		counterbutcooler = 0
		DisplayServer.window_set_title(randomasstext[randi_range(0, randomasstext.size() - 1)])
	#print(counter)
	if counter >= 1400 and Globals.totalwindows <= 12 and Conductor.cur_beat >= 64:
		counter = 0
		makewindow()

func makewindow():
	var window2 = window.duplicate()
	print("thicc thighs")
	self.add_child(window2)
	Globals.totalwindows += 1
	window2.position = Vector2(DisplayServer.window_get_position(0).x + randi_range(0, 1000), DisplayServer.window_get_position(0).y + randi_range(0, 600))
