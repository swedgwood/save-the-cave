extends Area2D

onready var player = get_node("../../Ashley")

func _input(event):
	if event.is_action_pressed("use") and overlaps_body(player):
		get_tree().change_scene("res://Scenes/RedRoom.tscn")