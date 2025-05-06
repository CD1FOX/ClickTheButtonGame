extends Node2D

#add a variable to count the clicks
var clickCount = 0

func RandomLocations():
	var randomNumberX = randi_range(21, 928)
	var randomNumberY = randi_range(59, 555)
	$Button.position.x = randomNumberX
	$Button.position.y = randomNumberY
	$Timer.start()

func _ready() -> void:
	RandomLocations()

func _process(_delta: float) -> void:
	$Label.text = "Score: " + str(clickCount)
	print(int($Timer.time_left))

func _on_button_pressed() -> void:
	clickCount += 1

func _on_timer_timeout() -> void:
	RandomLocations()
