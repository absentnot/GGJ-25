extends Market

class_name StaticMarket


var preDeterminedPrices: Array[int]
var day = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_setPrice(preDeterminedPrices[0])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func updatePrice(orders: Array[Order]) -> void:
	day +=1
	if(day>preDeterminedPrices.size() - 1):
		previousPrices.push_back(currentPrice)
		currentPrice = preDeterminedPrices[day]
