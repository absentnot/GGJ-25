extends Node

signal roundOver
var day
var market: Market
var agents: Array[Agent]
@export var agentTypes: Array[String]
@export var maxDays = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	market = get_tree().get_nodes_in_group("MarketGroup")[0]
	day = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func getMarketValue() -> int:
	return market.getCurrentPrice()

func getMarketDescription() -> Array[String]:
	return [market.getName(), market.getDescription()]

func getAgentTypes() -> Array[String]:
	return agentTypes

func getMaxDays() -> int:
	return maxDays

func isLastDay() -> bool:
	return day == maxDays

func processDay(orders: Array[Order]) -> void:
	day += 1
	print("Day in round: " + str(day))
	if(day > maxDays):
		roundOver.emit()
	else:
		market.updatePrice(orders)

func getPrices() -> Array[int]:
	return market.getPrices()
