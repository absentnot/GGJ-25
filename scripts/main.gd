extends Node2D


var currentRound = null
var maxDays
var currDay = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	loadRound()
	
func loadRound():
	currentRound = load("res://scenes/roundThree.tscn").instantiate()
	currentRound.roundOver.connect(endRound)
	maxDays = currentRound.getMaxDays()
	add_child(currentRound)
	$HUD.setAgents(currentRound.getAgentTypes())
	$HUD.setMarketValue(currentRound.getPrices(), maxDays - currDay)
	$DayTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_day_timer_timeout() -> void:
	print("Bing! Next day")
	var orders = $HUD.getOrders(currentRound.getPrices(), maxDays - currDay)
	currentRound.processDay(orders)
	currDay+=1
	$HUD.setMarketValue(currentRound.getPrices(), maxDays- currDay)
	$DayTimer.start()

func endRound() -> void:
	print("Round is over! Uh oh!")
	$DayTimer.set_paused(true)
	$DayTimer.stop()
	var stats = $HUD.getFinalStats()
	currentRound.queue_free()
	$HUD.visible = false
	var resultsScreen = load("res://scenes/score.tscn").instantiate()
	add_child(resultsScreen)
	resultsScreen.display(stats[0], stats[1])
