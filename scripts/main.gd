extends Node2D


var currentRound = null
# Called when the node enters the scene tree for the first time.
func _ready():
	currentRound = load("res://scenes/RoundOne.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_day_timer_timeout() -> void:
	#currentRound.processDay()
	$DayTimer.start()
	pass # Replace with function body.
