extends Node

class_name Market
const Order = preload("res://scripts/order.gd")


var currentPrice: int = 100
var previousPrices: Array[int] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("MarketGroup")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func updatePrice(orders: Array[Order]) -> void:
	pass

func getCurrentPrice() -> int:
	return currentPrice
	
func getPreviousPrices() -> Array[int]:
	return previousPrices
	
