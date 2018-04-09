extends Area2D

func _ready():
	if not Globals.yellow_key:
		connect("body_entered", self, "_body_entered")

func _body_entered(object):
	if object.name == "Ashley" and not Globals.yellow_key:
		Globals.yellow_key = true
		hide()