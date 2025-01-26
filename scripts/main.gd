extends Node2D


var currentRound = null
# Called when the node enters the scene tree for the first time.
func _ready():
	currentRound = load("res://scenes/roundFive.tscn").instantiate()
	currentRound.roundOver.connect(endRound)
	add_child(currentRound)
	$HUD.setMarketValue(currentRound.getMarketValue())
	$DayTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_day_timer_timeout() -> void:
	print("Bing! Next day")
	var order = $HUD.getPlayerOrder()
	currentRound.processDay(order)
	$HUD.setMarketValue(currentRound.getMarketValue())
	$DayTimer.start()

func endRound() -> void:
	print("Round is over! Uh oh!")
	$DayTimer.set_paused(true)
	$DayTimer.stop()
