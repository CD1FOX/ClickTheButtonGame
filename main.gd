extends Node2D

#add a variable to count the clicks
var clickCount = 0

var shrinkAlready = false

var ClickSoundScene = preload("res://click_sound.tscn")

func ShrinkSize():
	if not shrinkAlready:
		$Button.size.x -= 20
		$Button.size.y -= 20
	
	shrinkAlready = true;


func RandomLocations():
	var randomNumberX = randi_range(21, 928)
	var randomNumberY = randi_range(59, 555)
	$Button.position.x = randomNumberX
	$Button.position.y = randomNumberY
	$RepositionTimer.start()

func _ready() -> void:
	RandomLocations()
	$TimeLeftTimer.start()

func _process(_delta: float) -> void:
	#Increase Score
	$ScoreLabel.text = "Score: " + str(clickCount)
	
	#TimerLeft
	$TimeLeftLabel.text = "TIME: " + str(int($TimeLeftTimer.time_left))
	
	if clickCount % 10 == 0 and clickCount != 0:
		ShrinkSize()
	else:
		shrinkAlready = false
		
func _on_button_pressed() -> void:
	var sound = ClickSoundScene.instantiate()
	add_child(sound)
	clickCount += 1

func _on_timer_timeout() -> void:
	RandomLocations()

func _on_time_left_timer_timeout() -> void:
	if clickCount > Global.high_score:
		Global.high_score = clickCount
		Global.save_high_score()
	get_tree().change_scene_to_file("res://end_screen.tscn")
