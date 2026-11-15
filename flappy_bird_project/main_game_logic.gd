extends Node2D

@export var GameOverScreen:Node

func _ready() -> void:
	get_tree().paused = false

func _on_player_collided_with_pipe() -> void:
	print("Collided with pipe emitted signal")
	get_tree().paused = true
	GameOverScreen.visible = true


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_game.tscn")
