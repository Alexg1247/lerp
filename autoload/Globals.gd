extends Node

var KEY_COUNT: int = 4

var scroll_speed = 3
var song_multiplier: float = 1.0

var notes_hit = 0
var misses = 0

var volume = 0.5

var accuracy:float = 0.0

var fun = false

var mobile = false
var ismodded = false

var totalwindows = 0

var songlist = [
	"fatality",
	"phantasm",
	"toggogl downwall",
	"too slow encore",
	"i am god",
	"big shot",
	"lost my mind",
	"rush b",
	"triple-trouble-lyrics",
	"cys good",
	"endless encore",
	"dojo brawl",
	"endless depths",
	"redux guns",
	"too slow",
	"you cant run",
	"sussus moogus"
]

var moddedsonglist = DirAccess.get_directories_at("res://mods/songs/")

var score:Dictionary = {}

var save = Save.new().bind("Settings", "save")

var scoredata = Save.new().bind("ScoreData", "scores")

var comboname = "FC"

var currentsong = ""

var totalPlayed = 0

var uwu = false

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

var notecolour = Color(1, 0, 0, 1)

var d = true
