extends Area2D

onready var player = get_node("../../Ashley")
onready var unlocked = Globals.yellow_door_unlocked
onready var key = Globals.yellow_door_key

func _ready():
	if unlocked:
		get_node("Lock").hide()
	elif key:
		get_node("Lock").texture = preload("res://Assets/Sprites/Props/ActiveLock.png")

func _input(event):
	if event.is_action_pressed("use") and overlaps_body(player) and key:
		if unlocked:
			Globals.change_room("YellowRoom")
		else:
			Globals.yellow_door_unlocked = true
			unlocked = true
			get_node("Lock").hide()
