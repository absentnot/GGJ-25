extends Agent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func decide(prices: Array[int], daysRemaining: int) -> Order:
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
