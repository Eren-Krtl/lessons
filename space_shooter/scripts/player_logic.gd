extends CharacterBody2D

var MoveVelocity:Vector2
var ForceVelocity:Vector2
var Speed:int = 150

func _physics_process(delta: float) -> void:
	move_logic()
	self.velocity = MoveVelocity + ForceVelocity
	move_and_slide()
	
func move_logic():
	var direction:float = Input.get_axis("MoveLeft", "MoveRight")
	MoveVelocity.x = direction * Speed
