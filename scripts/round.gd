extends Node

signal roundOver
var day
@export var maxDays = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	day = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func processDay() -> void:
	day += 1
	print("Day in round: " + str(day))
	if(day > maxDays):
		roundOver.emit()
		return
	var orders: Array[Order] = []
	$SineMarket.updatePrice(orders)
	print($SineMarket.getCurrentPrice())
