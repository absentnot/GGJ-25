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
