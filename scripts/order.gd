class_name Order
enum OrderType {
	BUY,
	SELL,
	HOLD
}

var type = OrderType.HOLD
var qty = 0
func _init(quantity, oType=OrderType.HOLD):
	qty = quantity
	type = oType
	
func _to_string():
	return "%s: %s" % [OrderType.keys()[type], qty]
