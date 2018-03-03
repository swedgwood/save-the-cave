extends Camera2D

onready var follow = get_node("../Ashley")
const PADDING = 64
const SPEED = 2
var x = 0

func _ready():
	position = Globals.player_pos

func _process(delta):
	var pos = follow.position
	var difference = pos - position + (Globals.game_size/2)
	if difference.x < PADDING:
		move_local_x(-SPEED)
	elif difference.x > Globals.game_size.x-PADDING:
		move_local_x(SPEED)

	if difference.y < PADDING:
		move_local_y(-SPEED)
	elif difference.y > Globals.game_size.y-PADDING:
		move_local_y(SPEED)

	#position = Vector2(ceil(position.x)-0.5, ceil(position.y)-0.5)
