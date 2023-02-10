extends Node2D

@export var set_position_automatically: bool = true

func _ready():
	if Globals.save.grab("mobile_controls"):
		$"Mobile Shit".visible = true
		$"Mobile Shit".position.y -= 100
	
	if set_position_automatically:
		if Globals.save.grab("downscroll"):
			$strumline.position.y = 400
			$"Player Note".position.y = 400

func _on_left_pressed():
	Input.action_press("gameplay_0")

func _on_left_2_pressed():
	Input.action_press("gameplay_1")

func _on_left_3_pressed():
	Input.action_press("gameplay_2")

func _on_left_4_pressed():
	Input.action_press("gameplay_3")

func _on_touch_screen_button_pressed():
	Input.action_press("ui_cancel")

func _on_touch_screen_button_released():
	Input.action_release("ui_cancel")
