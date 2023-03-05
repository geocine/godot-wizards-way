extends Node

var isFullScreen = true

# Called when the node enters the scene tree for the first time.
func _ready():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("toggle_fullscreen"):
		if isFullScreen:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)	
			isFullScreen = false
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			isFullScreen = true
		print("test")
