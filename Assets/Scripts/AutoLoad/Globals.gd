extends Node

onready var game_size = OS.get_window_size()
var player_pos = Vector2(0, 0)
var red_door = false
var blue_door = false
var green_door = false
var yellow_door = false

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		red_door = true

func change_room(scene):
	get_tree().change_scene("res://Scenes/"+scene+".tscn")