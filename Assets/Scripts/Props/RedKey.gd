extends Area2D

func _ready():
	if not Globals.red_key:
		connect("body_entered", self, "_body_entered")

func _body_entered(object):
	if object.name == "Ashley" and not Globals.red_key:
		Globals.red_key = true
		Globals.blue_door_key = true
		hide()
