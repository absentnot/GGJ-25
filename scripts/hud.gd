extends Node

var playerOrder: Order.OrderType = Order.OrderType.HOLD
var orderQuantity: int = 0
var currentShares: int = 0
var currentMoney: int = 100
var marketVal: int = 0
@onready var graph = get_node("MarketVbox/Graph")
@onready var marketValueDisplay = get_node("MarketVbox/MarketValueDisplay")
@onready var playerCashDisplay = get_node("PlayerStats/PlayerCashDisplay")
@onready var playerSharesDisplay = get_node("PlayerStats/PlayerSharesDisplay")
@onready var orderVisualizer = get_node("PlayerActionsHBox/OrderVisualizer")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_updateCashAndShares(Order.new(0))

func getPlayerOrder() -> Order:
	print("Player quantity: " + str(orderQuantity))
	var nextOrder = Order.new(orderQuantity, playerOrder)
	_updateCashAndShares(nextOrder)
	return nextOrder
	
func getOrders(prices: Array[int], daysRemaining: int) -> Array[Order]:
	var agentOrders = $AgentPanel.getOrders(prices, daysRemaining)
	agentOrders.push_back(getPlayerOrder())
	return agentOrders
	
func setAgents(agentTypes:Array[String]) -> void:
	$AgentPanel.setAgents(agentTypes)
	
func setMarketValue(prices: Array[int], daysRemaining: int) -> void:
	var newVal = prices[prices.size()-1]
	marketVal = newVal
	marketValueDisplay.text = str(marketVal)
	graph.addPoint(newVal)
	getOrders(prices, daysRemaining)
	
func _updateCashAndShares(nextOrder: Order) -> void:
	match nextOrder.type:
		Order.OrderType.SELL:
			currentShares -= orderQuantity
			currentMoney += (orderQuantity * marketVal)
		Order.OrderType.BUY:
			currentShares += orderQuantity
			currentMoney -= (orderQuantity * marketVal)
		Order.OrderType.HOLD:
			pass
	playerCashDisplay.text = str(currentMoney) + " $UDS"
	playerSharesDisplay.text = str(currentShares) + " Shares"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _setOrderType(nextOrderType: Order.OrderType) -> void:
	playerOrder = nextOrderType
	orderVisualizer.updateOrder(nextOrderType)
	
	
func _on_sell_pressed() -> void:
	print("Sell is pressed!")
	if(orderQuantity < 1):
		print("Stupid player, you can't sell less than 1 share!")
	else:
		_setOrderType(Order.OrderType.SELL)

func _on_buy_pressed() -> void:
	print("Buy is pressed!")
	if(orderQuantity < 1):
		print("Stupid player, you can't buy less than 1 share!")
	else:
		_setOrderType(Order.OrderType.BUY)

func _on_hold_pressed() -> void:
	print("Hold is pressed!")
	_setOrderType(Order.OrderType.HOLD)

func _on_quantity_input_text_submitted(new_text: String) -> void:
	print("Text changed! New line: " + new_text)
	orderQuantity = int(new_text)
