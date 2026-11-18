extends CharacterBody2D

signal Game_Lost
signal Point_Gained

var Gravity = 20
var JumpPower = 500

func _physics_process(delta: float) -> void:
	if(position.y > 400 || position.y < -400):
		emit_signal("Game_Lost")
	velocity.y += Gravity
	move_and_slide()

func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("Jump")):
		velocity.y = -JumpPower

func _collision_2d_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Pipe")):
		emit_signal("Game_Lost")
	if(area.is_in_group("ScoreZone")):
		emit_signal("Point_Gained")
		print("collided and got point")
