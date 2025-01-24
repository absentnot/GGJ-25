extends Agent


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func decide(prices: Array[int], daysRemaining: int) -> Order:
	var currentDayEven = prices.size() % 2 == 0
	if currentDayEven:
		return Order.new(10, Order.OrderType.BUY)
	return Order.new(0)
