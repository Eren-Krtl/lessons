extends CharacterBody2D

signal Collided_With_Pipe

var Gravity = 20
var JumpPower = 500

func _physics_process(delta: float) -> void:
	velocity.y += Gravity
	move_and_slide()

func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("Jump")):
		velocity.y = -JumpPower

func _collision_2d_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Pipe")):
		emit_signal("Collided_With_Pipe")
