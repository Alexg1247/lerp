extends Node2D

var number = 0
# Called when the node enters the scene tree for the first time.
func _process(delta):
	#print(CoolUtil.getdaimagethingy("res://assets/images/credits/" + Globals.credits[number]))
	if number < 0:
		number += 5
	if number >= 5:
		number = 0
	$Label.text = Globals.credits[number]
	match number:
		0:
			$Label2.text = "made toggle downfall and L.wav"
		1:
			$Label2.text = "coolutil and conductor thanks!"
		2:
			$Label2.text = "me! i made this"
		3:
			$Label2.text = "beta tester"
		4:
			$Label2.text = "helped fix alot of shit"
		5:
			$Label2.text = "helped fix alot of other shit"
	

func _input(event):
	if Input.is_action_just_pressed("ui_left"):
		number -= 1
		var e = load("res://assets/images/credits/" + CoolUtil.getimage2("res://assets/images/credits", Globals.credits[number]))
		$Character.texture = e
		
	if Input.is_action_just_pressed("ui_right"):
		number += 1
		var e = load("res://assets/images/credits/" + CoolUtil.getimage2("res://assets/images/credits", Globals.credits[number]))
		$Character.texture = e
	
	


func _on_button_pressed():
	pass # Replace with function body.
