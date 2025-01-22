extends Node

class_name Market

var currentPrice: int = 100
var previousPrices: Array[int] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func updatePrice(orders: Array[Order]) -> void:
	pass

# Called by extending classes to set price.
func _setPrice(newPrice: int) -> void:
	currentPrice = newPrice
	
func getCurrentPrice() -> int:
	return currentPrice
	
func getPreviousPrices() -> Array[int]:
	return previousPrices
	
