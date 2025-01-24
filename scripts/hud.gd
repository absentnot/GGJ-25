extends Node


var playerOrder: Order.OrderType = Order.OrderType.HOLD
var playerQuantity: int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func getPlayerOrder() -> Order:
	print("Player quantity: " + str(playerQuantity))
	return Order.new(playerQuantity, playerOrder)

func setMarketValue(newVal: int) -> void:
	$MarketValueDisplay.text = str(newVal)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_sell_pressed() -> void:
	print("Sell is pressed!")
	if(playerQuantity < 1):
		print("Stupid player, you can't sell less than 1 share!")
	else:
		playerOrder = Order.OrderType.SELL
		print("Selling " + str(playerQuantity))

func _on_buy_pressed() -> void:
	print("Buy is pressed!")
	if(playerQuantity < 1):
		print("Stupid player, you can't buy less than 1 share!")
	else:
		playerOrder = Order.OrderType.BUY
		print("Buying " + str(playerQuantity))

func _on_hold_pressed() -> void:
	print("Hold is pressed!")
	playerOrder = Order.OrderType.HOLD

func _on_quantity_input_text_submitted(new_text: String) -> void:
	print("Text changed! New line: " + new_text)
	playerQuantity = int(new_text)
