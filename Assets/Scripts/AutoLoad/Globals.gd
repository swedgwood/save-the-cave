extends Node

onready var game_size = OS.get_window_size()
var player_pos = Vector2(0, 0)

func change_room(scene):
	get_tree().change_scene("res://Scenes/"+scene+".tscn")