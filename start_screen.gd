extends Node2D

func _ready() -> void:
	Global.load_high_score()
	$HighScoreLabel.text = "High Score: " + str(Global.high_score)

func _on_play_pressed() -> void:
	Global.time = int($TextEdit.text)
	get_tree().change_scene_to_file("res://main.tscn")
