extends Node

signal roundOver
var day
var market: Market
var agents: Array[Agent]
@export var maxDays = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	market = get_tree().get_nodes_in_group("MarketGroup")[0]
	agents.assign(get_tree().get_nodes_in_group("AgentGroup"))
	day = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func getMarketValue() -> int:
	return market.getCurrentPrice()

func processDay() -> void:
	day += 1
	print("Day in round: " + str(day))
	if(day > maxDays):
		roundOver.emit()
	else:
		var orders: Array[Order] = getOrders()
		print("Orders: " + str(orders))
		market.updatePrice(orders)
	return
	
func getOrders() -> Array[Order]:
	var ret: Array[Order] = []
	var previousPrices = market.getPreviousPrices()
	var daysRemaining = maxDays - previousPrices.size()
	for each in agents:
		ret.push_back(each.decide(previousPrices, daysRemaining))
	return ret
