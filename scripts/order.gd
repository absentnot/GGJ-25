class_name Order
enum OrderType {
	BUY,
	SELL,
	HOLD
}

var type = OrderType.HOLD
var quantity = 0
func _init(quantity, oType=OrderType.HOLD):
	quantity = quantity
	type = oType
	
func _to_string():
	return "%s: %d" % [OrderType.keys()[type], quantity]
