extends Area2D

func _ready():
	if not Globals.blue_key:
		connect("body_entered", self, "_body_entered")

func _body_entered(object):
	if object.name == "Ashley" and not Globals.blue_key:
		Globals.blue_key = true
		Globals.green_door_key = true
		hide()
