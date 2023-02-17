extends Window

var fakerrors = [
	"Error! res://pAYSlate.gd:16 - Parse Error: Song not found '" + str(Globals.songlist[randi_range(0, Globals.songlist.size() - 1)]) +"' in pAYSlate.gd",
	"Null Object Reference",
	"LINE 1111 EMULATOR",
	"Error #" + str(randi_range(1000, 9999)) + " Unsigned Character",
	"lerp(): no crash handler, No audio found for song in FreePlaySongList.txt is",
	"src/lerp/scnee/paYSlate.gd:45: song '" + str(Globals.songlist[randi_range(0, Globals.songlist.size() - 1)]) +"' found in Globals.gd!"
]

func _ready():
	$Label.text = fakerrors[randi_range(0, fakerrors.size() - 1)]

func _on_button_pressed():
	queue_free()
	Globals.d = true
