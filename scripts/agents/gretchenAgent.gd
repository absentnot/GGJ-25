extends Agent

func decide(prices: Array[int], daysRemaining: int) -> Order:
	var currentDayEven = prices.size() % 2 == 0
	if currentDayEven:
		return Order.new(10, Order.OrderType.BUY)
	return Order.new(0)

func _init() -> void:
	super._init("gretchen.png")
