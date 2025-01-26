extends Node2D
var parameter: int
var currentRound = null

var maxDays
var currDay = 0
# Called when the node enters the scene tree for the first time.
var resultScreen
func _ready():
	$Tutorial.visible = true
	
func loadRound():
	if(resultScreen != null):
		resultScreen.queue_free()
	print("res://scenes/%s.tscn" % Global.level)
	currentRound = load("res://scenes/%s.tscn" % Global.level).instantiate()
	#currentRound = load("res://scenes/roundEight.tscn").instantiate()
	currentRound.roundOver.connect(endRound)
	maxDays = currentRound.getMaxDays()
	currDay = 0
	add_child(currentRound)
	$HUD.visible = true
	$HUD.reset(maxDays)
	$HUD.setMarketDescription(currentRound.getMarketDescription())
	$HUD.setAgents(currentRound.getAgentTypes())
	$HUD.setMarketValue(currentRound.getPrices(), maxDays - currDay)
	$DayTimer.start()
	$DayTimer.paused = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_day_timer_timeout() -> void:
	endDay()
	
func _on_hud_locked() -> void:
	endDay()

func endDay() -> void:
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
	resultScreen = load("res://scenes/score.tscn").instantiate()
	resultScreen.nextLevel.connect(_nextLevel)
	resultScreen.sameLevel.connect(loadRound)
	add_child(resultScreen)
	resultScreen.display(stats[0], stats[1])

func _nextLevel() -> void:
	match Global.level:
		"roundOne":
			Global.level = "roundTwo"
		"roundTwo":
			Global.level = "roundThree"
		"roundThree":
			Global.level = "roundFour"
		"roundFour":
			Global.level = "roundFive"
		"roundFive":
			Global.level = "roundSix"
		"roundSix":
			Global.level = "roundSeven"
		"roundSeven":
			Global.level = "roundEight"
		_:
			Global.level = "roundOne"
	loadRound()


func _on_tutorial_tutorial_end() -> void:
	$Tutorial.visible = false
	loadRound()
