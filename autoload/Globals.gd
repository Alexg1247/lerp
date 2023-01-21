extends Node

var KEY_COUNT: int = 4

var scroll_speed = 3
var song_multiplier: float = 1.0

var notes_hit = 0
var misses = 0

var volume = 0.5

var fun = false

var mobile = false

var songlist = [
	"fatality",
	"phantasm",
	"doomsday",
	"toggogl downwall",
	"too slow encore",
	"i am god",
	"big shot",
	"lost my mind",
	"rush b",
	"triple-trouble-lyrics",
	"triple-trouble-brodo",
	"cys good",
	"endless encore",
	"insult",
	"dojo brawl",
	"endless depths",
	"redux guns",
	"too slow",
	"you cant run"
]

var score:Dictionary = {}

var save = Save.new().bind("Settings", "save")

var scoredata = Save.new().bind("ScoreData", "scores")

var comboname = "FC"

var currentsong = ""

signal player_note_hit(note, dir, type)
signal enemy_note_hit(note, dir, type)

var credits = [
	"sevcon",
	"swordcube",
	"alexg1247",
	"v01d",
	"leather128",
	"raf"
]
