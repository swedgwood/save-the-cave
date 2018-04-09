extends KinematicBody2D

onready var debug = get_node("../Camera2D/Debug")
onready var anim = get_node("AnimationPlayer")
onready var sprite = get_node("Sprite")

var vel = Vector2(0, 0)
var step = 50
var friction = 100
var gravity = 25
var jumps = 1
var jump_force = 300
const UP = Vector2(0, -1)
const MAX_SPEED = 5000
const MAX_MOVE_SPEED = 100
const MAX_JUMPS = 1

func _ready():
	position = Globals.player_pos

func _process(delta):
	if Input.is_action_just_pressed("move_right"):
		sprite.scale.x = 1
	elif Input.is_action_just_pressed("move_left"):
		sprite.scale.x = -1
		
	if not is_on_floor():
		if anim.current_animation != "ashley_falling":
			anim.play("ashley_falling")
	elif Input.is_action_pressed("move_right") or Input.is_action_pressed("move_left"):
		if anim.current_animation != "ashley_moving":
			anim.play("ashley_moving")
	else:
		anim.current_animation = "ashley_idle"

func _physics_process(delta):
	if Input.is_action_pressed("move_right"):
		vel.x += step
		if vel.x > MAX_MOVE_SPEED:
			vel.x = MAX_MOVE_SPEED
	elif Input.is_action_pressed("move_left"):
		vel.x -= step
		if vel.x < -MAX_MOVE_SPEED:
			vel.x = -MAX_MOVE_SPEED
	else:
		if vel.x > 0:
			vel.x -= friction
			vel.x = clamp(vel.x, 0, MAX_SPEED)
		elif vel.x < 0:
			vel.x += friction
			vel.x = clamp(vel.x, -MAX_SPEED, 0)
	
	if is_on_ceiling():
		vel.y = clamp(vel.y, 0, MAX_SPEED)
	if is_on_floor():
		jumps = MAX_JUMPS
		vel.y = clamp(vel.y, -MAX_SPEED, gravity)
	else:
		vel.y += gravity
		
	if Input.is_action_just_pressed("move_jump"):
		if jumps > 0:
			vel.y = -jump_force
			jumps -= 1

	vel.x = clamp(vel.x, -MAX_SPEED, MAX_SPEED) 
	vel.y = clamp(vel.y, -MAX_SPEED, MAX_SPEED)
	move_and_slide(vel, UP)
	
	Globals.player_pos = position
	
	#debug.text = ""
	#debug.text += str(Globals.game_size) + "\n"  # game size
	#debug.text += str(jumps) # no. of jumps
	#debug.text += str(vel) + "\n"  # velocity
	#debug.text += str(get_position()) + "\n"  # position
	#debug.text += str(is_on_floor()) + "\n"  # on floor
	#debug.text += str(is_on_ceiling()) + "\n"  # on ceiling
	#debug.text += "(" + str(scale.x) + ", " + str(scale.y) + ")"  # scale