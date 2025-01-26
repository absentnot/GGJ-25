extends Agent

func decide(prices: Array[int], daysRemaining: int) -> Order:
	if daysRemaining == 0:
		return Order.new(10, Order.OrderType.BUY)
	return Order.new(0)

func _init() -> void:
	spriteName = "shellstrong.png"
