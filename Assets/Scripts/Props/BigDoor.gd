extends Area2D

onready var player = get_node("../../Ashley")
onready var red_lock = get_node("RedLock")
onready var blue_lock = get_node("BlueLock")
onready var green_lock = get_node("GreenLock")
onready var yellow_lock = get_node("YellowLock")

func _ready():
	if Globals.red_unlocked:
		red_lock.hide()
	elif Globals.red_key:
		red_lock.texture = preload("res://Assets/Sprites/Props/RedActiveLock.png")
	
	if Globals.blue_unlocked:
		blue_lock.hide()
	elif Globals.blue_key:
		blue_lock.texture = preload("res://Assets/Sprites/Props/BlueActiveLock.png")
	
	if Globals.green_unlocked:
		green_lock.hide()
	elif Globals.green_key:
		green_lock.texture = preload("res://Assets/Sprites/Props/GreenActiveLock.png")
	
	if Globals.yellow_unlocked:
		yellow_lock.hide()
	elif Globals.yellow_key:
		yellow_lock.texture = preload("res://Assets/Sprites/Props/YellowActiveLock.png")
	
func _input(event):
	if event.is_action_pressed("use") and overlaps_body(player):
		if Globals.red_unlocked and Globals.blue_unlocked and Globals.green_unlocked and Globals.yellow_unlocked:
			print("WIN")
		else:
			if Globals.red_key and not Globals.red_unlocked:
				red_lock.hide()
				Globals.red_unlocked = true
			if Globals.blue_key and not Globals.blue_unlocked:
				blue_lock.hide()
				Globals.blue_unlocked = true
			if Globals.green_key and not Globals.green_unlocked:
				green_lock.hide()
				Globals.green_unlocked = true
			if Globals.yellow_key and not Globals.yellow_unlocked:
				yellow_lock.hide()
				Globals.yellow_unlocked = true
