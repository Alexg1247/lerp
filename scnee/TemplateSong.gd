extends Control

var songname = "template"
# Called when the node enters the scene tree for the first time



func _on_panel_pressed():
	Globals.currentsong = songname
	var scene = preload("res://node_2d.tscn")
	get_tree().change_scene_to_packed(scene)
