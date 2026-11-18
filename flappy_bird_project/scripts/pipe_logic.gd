extends CharacterBody2D

var Speed = 200

func _physics_process(delta: float) -> void:
	if(position.x <= -650):
		self.queue_free()
	velocity.x = -Speed
	move_and_slide()
