extends Node

onready var game_size = OS.get_window_size()
var player_pos = Vector2(0, 0)
var current_room = "MainRoom"

var red_key = false
var red_unlocked = false
var red_door_key = true
var red_door_unlocked = false

var blue_key = false
var blue_unlocked = false
var blue_door_key = false
var blue_door_unlocked = false

var green_key = false
var green_unlocked = false
var green_door_key = false
var green_door_unlocked = false

var yellow_key = false
var yellow_unlocked = false
var yellow_door_key = false
var yellow_door_unlocked = false

#func _process(delta):
#	print(blue_key)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		red_key = true

func change_room(scene):
	if File.new().file_exists("res://Scenes/%s.tscn" % scene):
		get_tree().change_scene("res://Scenes/%s.tscn" % scene)
		current_room = scene