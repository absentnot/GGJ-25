extends Node

class_name Agent
const Order = preload("res://scripts/order.gd")

var currentShares: int = 0
var currentCapital: int = 100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func decide(prices: Array[int], daysRemaining: int) -> Order:
	return Order.new(0)
