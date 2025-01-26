extends Node

class_name Market

var prices: Array[int] = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("MarketGroup")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func updatePrice(orders: Array[Order]) -> void:
	pass

func getPrices() -> Array[int]:
	return prices
	
func _fluctuate() -> int:
	var currentPrice = prices[prices.size()-1]
	var delta = randi_range(-5, 15)
	var newPrice = max(0, currentPrice + delta)
	return newPrice
	
func getName() -> String:
	return ""
func getDescription() -> String:
	return ""
	
