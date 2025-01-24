extends Node


var playerOrder: Order.OrderType = Order.OrderType.HOLD
var orderQuantity: int = 0
var currentShares: int = 0
var currentMoney: int = 100
var marketVal: int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_updateCashAndShares(Order.new(0))

func getPlayerOrder() -> Order:
	print("Player quantity: " + str(orderQuantity))
	var nextOrder = Order.new(orderQuantity, playerOrder)
	_updateCashAndShares(nextOrder)
	return nextOrder

func setMarketValue(newVal: int) -> void:
	marketVal = newVal
	$MarketValueDisplay.text = str(marketVal)
	
func _updateCashAndShares(nextOrder: Order) -> void:
	print("Updating cash and shares")
	match nextOrder.type:
		Order.OrderType.SELL:
			currentShares -= orderQuantity
			currentMoney += (orderQuantity * marketVal)
		Order.OrderType.BUY:
			currentShares += orderQuantity
			currentMoney -= (orderQuantity * marketVal)
		Order.OrderType.HOLD:
			print("I have received a hold order , weird")
			pass
	$PlayerCashDisplay.text = str(currentMoney) + " $UDS"
	$PlayerSharesDisplay.text = str(currentShares) + " Shares"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_sell_pressed() -> void:
	print("Sell is pressed!")
	if(orderQuantity < 1):
		print("Stupid player, you can't sell less than 1 share!")
	else:
		playerOrder = Order.OrderType.SELL

func _on_buy_pressed() -> void:
	print("Buy is pressed!")
	if(orderQuantity < 1):
		print("Stupid player, you can't buy less than 1 share!")
	else:
		playerOrder = Order.OrderType.BUY

func _on_hold_pressed() -> void:
	print("Hold is pressed!")
	playerOrder = Order.OrderType.HOLD

func _on_quantity_input_text_submitted(new_text: String) -> void:
	print("Text changed! New line: " + new_text)
	orderQuantity = int(new_text)
