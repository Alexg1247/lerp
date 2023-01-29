extends Node2D

var counter = 0
var counterbutcooler = 0

var randomasstext = [
	"s͡d͠oh̀f͝u̴iu͠f",
	"F͞a̢TA̕L͞ ̛E͠r̷OR͟R",
	"A҉ ̷F́ATA͏L҉ ̧E̕ŖROR̨ HAS̡ O̵C̶CU͢RRED ͠",
	"null",
	"Godo͟t͠ E̸ngíne̡ ͞4͘.̕0",
	"le҉r̷p(̢):͠ ͏the̴ ryth̀m̵ ͡g̵ame",
	"Friday Night Funkin' Psych Engine",
	"S̵Y̵NT͝AX ̴ER̵R̡OR ̸",
	"IL͟L̴E̷G̢̕҉A͜L̵̸̨ ͢IǸS̴̸T̛R̀͟U҉CT̨͢I̶͞Ò̡N̴͏͢",
	"Thanks̸ ̢Le͜át͡her̡1̡28̸ ͞fo̧r͠ ̀h͟el̡p̨ing ͏al̵ot w̵ith̨ ̵t͏h͡i̷s͡ st̶up͞id͘ t̡h͜i̸n̕g",
	"L͠I̵̕͏̸̀N͏E̴͜1̡̨̛́͢1̶1͝͝͞1̛͘͟͡ ̨̀͢͜E͢͞͝M̛͡U̢͟͏L̵̛A̧̕T̶̴̡͠O̷̶̴̴͡R̵̢͜͟",
	"D̶̢̡̢͜r͟͡ǫ̵̨͟͠w̴̵̢͠͝n̵̢͠í́͝͡͡n̴̸͏g̶͝҉́,̴́ ̨́́̕͡D́͘҉̢͝ŗ̴̧͝ò̷w̕͜͡͞n͏͜͏̵i̶͜͏ń̸g̶͟͜͠͡,͟͞͝ ͢͜S̡̀̕͟í̧̢n̵͠ḱ̷͜į̷̴̷͟n̵̛g͡҉,̡̢͠ ̀́S̨̧i̵̕͠n͘͝҉ķ̕͡i̶̢n̨͡g̕͝҉",
	"Null Object Reference"
]

var window = load("res://assets/songs/fatality/thewindowthing.tscn").instantiate()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	counter += randi_range(0, 1)
	counterbutcooler += randi_range(0, 1)
	if counterbutcooler >= 200 and Conductor.cur_beat >= 64:
		counterbutcooler = 0
		if Globals.save.grab("just dont"):
			DisplayServer.window_set_title(Marshalls.utf8_to_base64(randomasstext[randi_range(0, randomasstext.size() - 1)]) )
		else:
			DisplayServer.window_set_title(randomasstext[randi_range(0, randomasstext.size() - 1)])
	#print(counter)
	if counter >= 1400 and Globals.totalwindows <= 12 and Conductor.cur_beat >= 64:
		counter = 0
		makewindow()

func makewindow():
	var window2 = window.duplicate()
	#print("thicc thighs")
	self.add_child(window2)
	Globals.totalwindows += 1
	window2.position = Vector2(DisplayServer.window_get_position(0).x + randi_range(-400, 1000), DisplayServer.window_get_position(0).y - 300 + randi_range(-200, 500))
