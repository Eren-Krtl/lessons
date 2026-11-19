extends CharacterBody2D

@export var PacBullet:PackedScene

var MoveVelocity:Vector2
var ForceVelocity:Vector2
var Speed:int = 150

var IsShooting:bool
var CanShoot:bool

func _physics_process(delta: float) -> void:
	move_logic()
	self.velocity = MoveVelocity + ForceVelocity
	if(IsShooting):
		shoot_logic()
	move_and_slide()
	
func move_logic():
	var direction:float = Input.get_axis("MoveLeft", "MoveRight")
	MoveVelocity.x = direction * Speed

func shoot_logic():
	var PreBullet = PacBullet.instantiate()
	PreBullet.global_position = %ShootPosition.global_position
	add_sibling(PreBullet)

func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("Shoot")):
		IsShooting = true
	if(event.is_action_released("Shoot")):
		IsShooting = false
