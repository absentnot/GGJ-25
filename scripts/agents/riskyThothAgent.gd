extends Agent

func _next_order(prices: Array[int], daysRemaining: int) -> Order:
	var numPrices = prices.size()
	# If today is the first day, we do not buy.
	if(numPrices < 2):
		return Order.new(0)
	var lastPrice = prices[numPrices-1]
	var twoPricesAgo = prices[numPrices-2]
	# If the price dropped and the new value is less than half the old, buy.
	if (lastPrice < twoPricesAgo and  (lastPrice * 2) < twoPricesAgo):
		return Order.new(10, Order.OrderType.BUY)
	# Otherwise, we do not buy.
	return Order.new(0)

func _init() -> void:
	spriteName = "thoth.png"
