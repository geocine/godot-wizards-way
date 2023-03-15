extends "../common/game_object.gd"


const SPEED = 200.0

@onready var PGrid: Grid = get_parent()

func _ready():
	update_look_direction(Vector2(1, 0))

func get_input_direction():
	return Vector2(
		int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")),
		int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	)
	
func update_look_direction(direction):
	if direction.x > 0:
		$Sprite.flip_h = true
	elif direction.x < 0:
		$Sprite.flip_h = false

func _process(delta):
	var input_direction = get_input_direction()
	if input_direction == Vector2(0,0):
		return
	update_look_direction(input_direction)
	
	var target_position = PGrid.request_move(self, input_direction)
	if target_position:
		move_to(target_position)
	else:
		bump()
	
	
func move_to(target_position):
	set_process(false)
	$AnimationPlayer.play("Walk")

	# Move the node to the target cell instantly,
	# and animate the sprite moving from the start to the target cell

	var tween = get_tree().create_tween()
	tween.tween_property(self, "position",target_position,$AnimationPlayer.current_animation_length).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)

	await $AnimationPlayer.animation_finished
	
	set_process(true)

func bump():
	set_process(false)
	$AnimationPlayer.play("Idle")
	await $AnimationPlayer.animation_finished
	set_process(true)
