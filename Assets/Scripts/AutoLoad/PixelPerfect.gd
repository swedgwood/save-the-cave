extends Node

onready var game_size = OS.get_window_size()

func get_scale(window_size):
	var scalex = max(floor(window_size.x/game_size.x), 1)
	var scaley = max(floor(window_size.y/game_size.y), 1)
	return min(scalex, scaley)

func get_size(scale):
	return game_size * scale

func get_padding(parent_size, child_size):
	var paddingx = (parent_size.x-child_size.x)/2
	var paddingy = (parent_size.y-child_size.y)/2
	return Vector2(paddingx, paddingy)

func get_window_size(screen_size):
	var scale = get_scale(screen_size)
	scale = max(scale-1, 1)
	return get_size(scale)
	
func _screen_resized():
	var root = get_tree().get_root()
	var window_size = OS.get_window_size()
	var scale = get_scale(window_size)
	var new_size = get_size(scale)
	var padding = get_padding(window_size, new_size)
	var new_rect = Rect2(padding, new_size)
	root.set_attach_to_screen_rect(new_rect)
	VisualServer.black_bars_set_margins(padding.x, padding.y, padding.x, padding.y)
	
func _ready():
	var tree = get_tree()
	tree.connect("screen_resized", self, "_screen_resized")
	var window_size = OS.get_screen_size()
	var start_size = get_window_size(window_size)
	OS.set_window_size(start_size)
	var screen_padding = get_padding(window_size, start_size)
	OS.set_window_position(screen_padding)
	_screen_resized()