extends Node2D

#add a variable to count the clicks
var clickCount = 0

func _process(_delta: float) -> void:
	$Label.text = "Score: " + str(clickCount)

func _on_button_pressed() -> void:
	clickCount += 1
