extends Market
#Amount for price to be multiplied by if it moves.
var priceSwingAmount = 2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currentPrice = 50

# If exactly one agent buys, the price goes up.
func updatePrice(orders: Array[Order]) -> void:
	var buyOrders = orders.filter(func(order:Order): return order.type == Order.OrderType.BUY).size()
	var nextPrice = currentPrice
	if(buyOrders == 1):
		nextPrice = currentPrice * priceSwingAmount
	previousPrices.push_back(currentPrice)
	currentPrice = nextPrice
	
