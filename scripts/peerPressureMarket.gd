extends Market
#Amount for price to be multiplied or divided by if it moves.
var priceSwingAmount = 1.5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currentPrice = 50

# If more than half of the agents buy or sell, price goes up or down, respectively.
func updatePrice(orders: Array[Order]) -> void:
	var triggerNumber = orders.size() / 2
	var nextPrice = currentPrice
	# If there's an odd number of agents, round up.
	if(orders.size()%2==1):
		triggerNumber += 1
	var buyOrders = orders.filter(func(order:Order): return order.type == Order.OrderType.BUY).size()
	if(buyOrders >= triggerNumber):
		nextPrice = currentPrice * priceSwingAmount
	var sellOrders = orders.filter(func(order:Order): return order.type == Order.OrderType.SELL).size()
	if(sellOrders >= triggerNumber):
		nextPrice = currentPrice / priceSwingAmount
	previousPrices.push_back(currentPrice)
	currentPrice = nextPrice
	
