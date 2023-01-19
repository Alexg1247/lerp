extends Node
class_name Modchart

@onready var gameplay = get_tree().get_root().get_node("Node2D")
@onready var fpstext = get_tree().get_root().get_node("FPS")
@onready var ui = gameplay.get_node("UI")

@onready var playerstrums = ui.get_node("STRUM2/strumline")
@onready var playernotes = ui.get_node("STRUM2/Player Note")

func _ready():
	Conductor.connect("beat_hit", beat_hit)
	Conductor.connect("step_hit", step_hit)

func beat_hit():
	pass

func step_hit():
	pass
