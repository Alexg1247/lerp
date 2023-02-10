extends Modchart

func _ready():
	Globals.fun = true

func _process(delta):
	#print(get_viewport().get_mouse_position()) #520 316
	#get_viewport().warp_mouse(Vector2(520, 316))
	if get_viewport().get_mouse_position().x <= 30:
		get_viewport().warp_mouse(Vector2(520, 316))
	elif get_viewport().get_mouse_position().x >= 1111:
		get_viewport().warp_mouse(Vector2(520, 316))
	elif get_viewport().get_mouse_position().y >= 630:
		get_viewport().warp_mouse(Vector2(520, 316))
	elif get_viewport().get_mouse_position().y <= 40:
		get_viewport().warp_mouse(Vector2(520, 316))
	
	if Input.is_action_just_pressed("fun is inf"):
		OS.shell_open("https://youtu.be/LUOeIWOMUEU")
