extends Area2D

onready var player = get_node("../../Ashley")
var locked = true

func _ready():
	if Globals.red_door:
		locked = false
		get_node("Lock").hide()

func _input(event):
	if event.is_action_pressed("use") and overlaps_body(player) and Globals.red_door:
		if locked:
			get_node("Lock").hide()
			locked = false
		else:
			Globals.change_room("RedRoom")