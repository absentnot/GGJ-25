extends Market
#Amount for price to be multiplied or divided by if it moves.
var priceSwingAmount = 1.5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	prices = [50]

# If more than half of the agents buy or sell, price goes up or down, respectively.
func updatePrice(orders: Array[Order]) -> void:
	var triggerNumber = orders.size() / 2
	var currentPrice = prices[prices.size()-1]
	var nextPrice = _fluctuate()
	var buyOrders = orders.filter(func(order:Order): return order.type == Order.OrderType.BUY).size()
	if(buyOrders > triggerNumber):
		nextPrice = roundi(currentPrice * priceSwingAmount)
	var sellOrders = orders.filter(func(order:Order): return order.type == Order.OrderType.SELL).size()
	if(sellOrders > triggerNumber):
		nextPrice = roundi(currentPrice / priceSwingAmount)
	prices.push_back(nextPrice)
	

func getName() -> String:
	return "Peer Pressure"
	
func getDescription() -> String:
	return "This market will swing heavily towards the direction most traders are moving"
	
