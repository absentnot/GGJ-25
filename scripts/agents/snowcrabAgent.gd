extends Agent

func decide(prices: Array[int], daysRemaining: int) -> Order:
	return Order.new(10, Order.OrderType.SELL)

func _init() -> void:
	spriteName = "snowcrab.png"
