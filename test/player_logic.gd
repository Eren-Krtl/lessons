extends CharacterBody2D

signal Game_Lost
signal Point_Gained

@onready var AniPlayer:AnimationPlayer = %AnimationPlayer
@onready var JumpParticle:CPUParticles2D = %JumpParticle
@onready var Sprite:AnimatedSprite2D = %AnimatedSprite
@onready var FlapAudio:AudioStreamPlayer2D = %AudioFlap

var Gravity = 20
var JumpPower = 500

func _physics_process(delta: float) -> void:
	if(position.y > 400 || position.y < -400):
		emit_signal("Game_Lost")
	velocity.y += Gravity
	move_and_slide()

func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("Jump")):
		flap_wings()

func _collision_2d_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Pipe")):
		emit_signal("Game_Lost")
	if(area.is_in_group("ScoreZone")):
		emit_signal("Point_Gained")
		print("collided and got point")

func flap_wings():
	FlapAudio.stop()
	FlapAudio.play()
	Sprite.stop()
	Sprite.play("flap")
	AniPlayer.stop()
	AniPlayer.play("flap")
	JumpParticle.emitting = true
	velocity.y = -JumpPower
