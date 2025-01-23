extends Node2D


var currentRound = null
# Called when the node enters the scene tree for the first time.
func _ready():
	currentRound = load("res://scenes/roundOne.tscn").instantiate()
	currentRound.roundOver.connect(endRound)
	add_child(currentRound)
	$DayTimer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_day_timer_timeout() -> void:
	print("Bing! Next day")
	currentRound.processDay()
	$DayTimer.start()

func endRound() -> void:
	print("Round is over! Uh oh!")
	$DayTimer.stop()
