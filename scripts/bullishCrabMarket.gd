extends Market

var preDeterminedPrices: Array[int] = [50, 60, 70, 80, 90, 100]
var day = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_setPrice(preDeterminedPrices[0])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func updatePrice(sharesBought: int, sharesSold: int, numCrabs: int) -> void:
	day +=1
	if(day>preDeterminedPrices.size() - 1):
		_setPrice(preDeterminedPrices[day])
