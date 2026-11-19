extends CharacterBody2D

var Speed:float = 250

func _physics_process(delta: float) -> void:
	move_logic()
	move_and_slide()

func move_logic():
	self.velocity = -transform.y * Speed
	if(self.position.y <= -430):
		queue_free()
