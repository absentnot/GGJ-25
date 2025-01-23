extends Node

signal roundOver
var day
var market: Market
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

func processDay() -> void:
	day += 1
	print("Day in round: " + str(day))
	if(day > maxDays):
		roundOver.emit()
	else:
		var orders: Array[Order] = []
		market.updatePrice(orders)
	return
