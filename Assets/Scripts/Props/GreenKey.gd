extends Area2D

func _ready():
	if not Globals.green_key:
		connect("body_entered", self, "_body_entered")

func _body_entered(object):
	if object.name == "Ashley" and not Globals.green_key:
		Globals.green_key = true
		Globals.yellow_door_key = true
		hide()
