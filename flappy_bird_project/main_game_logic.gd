extends Node2D

@export var GameOverScreen:Node
@export var ScoreLabel:Label
@export var PacPipe:PackedScene

var Score = 0

func _ready() -> void:
	get_tree().paused = false

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_game.tscn")

func _on_timer_timeout() -> void:
	var PrePipe = PacPipe.instantiate()
	PrePipe.position.x = 650
	PrePipe.position.y = randf_range(-300, 300)
	add_child(PrePipe)

func _on_player_game_lost() -> void:
	print("Collided with pipe emitted signal")
	get_tree().paused = true
	GameOverScreen.visible = true

func _on_player_point_gained() -> void:
	Score += 1
	ScoreLabel.text = "Score: " + str(Score)
	
