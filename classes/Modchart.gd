extends Node
class_name Modchart

@onready var gameplay = get_tree().get_root().get_node("Node2D")
@onready var fpstext = get_tree().get_root().get_node("FPS")
@onready var ui = gameplay.get_node("UI")
@onready var camera = gameplay.get_node("Camera")

@onready var playerstrums = ui.get_node("STRUM2/strumline")
@onready var playernotes = ui.get_node("STRUM2/Player Note")

func _ready():
	Conductor.connect("beat_hit", beat_hit)
	Conductor.connect("step_hit", step_hit)

func beat_hit():
	pass

func step_hit():
	pass

func thefuckingpsychenginecameraflashtrademark(color:Color = Color(1,1,1,1), time:float = 0.5):
	var flash = ColorRect.new()
	var SLERP = get_tree().create_tween()
	flash.size = Vector2(2000, 2000)
	flash.color = color
	flash.position = Vector2(-200, -200)
	SLERP.tween_property(flash, "modulate:a", 0.0, time)
	add_child(flash)
