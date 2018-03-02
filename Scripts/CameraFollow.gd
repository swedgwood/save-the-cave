extends Camera2D

onready var follow = get_node("/root/Scene1/Ashley")
const PADDING = 64
const SPEED = 2
var x = 0
func _process(delta):
	var pos = follow.position
	var difference = pos - position + (Constants.game_size/2)
	if difference.x < PADDING:
		move_local_x(-SPEED)
	elif difference.x > Constants.game_size.x-PADDING:
		move_local_x(SPEED)

	if difference.y < PADDING:
		move_local_y(-SPEED)
	elif difference.y > Constants.game_size.y-PADDING:
		move_local_y(SPEED)
	
	#position = Vector2(ceil(pos.x)-0.5, ceil(pos.y)-0.5)
	get_node("Debug").text = str(position)
