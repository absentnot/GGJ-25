extends Market
#Amount for price to be multiplied by if it moves.
var priceSwingAmount = 2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	prices = [50]

# If exactly one agent buys, the price goes up.
func updatePrice(orders: Array[Order]) -> void:
	var buyOrders = orders.filter(func(order:Order): return order.type == Order.OrderType.BUY).size()
	var currentPrice = prices[prices.size()-1]
	var nextPrice = currentPrice
	if(buyOrders == 1):
		nextPrice = currentPrice * priceSwingAmount
	prices.push_back(nextPrice)
	

func getName() -> String:
	return "Lone Wolf"
	
func getDescription() -> String:
	return "This market will only increase if exactly one trader buys!"
