extends Area2D

@onready var anim = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Character":
		anim.play("collected")
		$AudioStreamPlayer.play()
		var tween = create_tween()
		tween.tween_property(self, "position", position + Vector2(0,-5), 0.5)
		tween.tween_property(self, "modulate:a", 0, 0.5)
		await anim.animation_finished
		queue_free()
		

