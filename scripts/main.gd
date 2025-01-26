extends Node2D
var parameter: int
var currentRound = null



#var currentRound = null
# Called when the node enters the scene tree for the first time.
func _ready():
	print("Request for received for level:", Global.level)

	
	print("Launching level ", Global.level)
	
	if Global.level == 1:
		currentRound = load("res://scenes/roundOne.tscn").instantiate()
		currentRound.roundOver.connect(endRound)
		add_child(currentRound)
		$DayTimer.start()	
	elif Global.level == 2:
		currentRound = load("res://scenes/roundTwo.tscn").instantiate()
		currentRound.roundOver.connect(endRound)
		add_child(currentRound)
		$DayTimer.start()	
	elif Global.level == 3:
		currentRound = load("res://scenes/roundThree.tscn").instantiate()
		currentRound.roundOver.connect(endRound)
		add_child(currentRound)
		$DayTimer.start()	
	elif Global.level == 4:
		currentRound = load("res://scenes/roundThree.tscn").instantiate()
		currentRound.roundOver.connect(endRound)
		add_child(currentRound)
		$DayTimer.start()	
	elif Global.level == 5:
		currentRound = load("res://scenes/roundFour.tscn").instantiate()
		currentRound.roundOver.connect(endRound)
		add_child(currentRound)
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
