extends Node

signal locked
var playerOrder: Order.OrderType = Order.OrderType.HOLD
var orderQuantity: int = 0
var currentShares: int = 0
var currentMoney: int = 100
var marketVal: int = 0
var totalSharesBought:int = 0
var initialMoney:int = 100
@onready var graph = get_node("MarketVbox/Graph")
@onready var marketValueDisplay = get_node("MarketVbox/MarketInfo/MarketValue")
@onready var marketNameDisplay = get_node("MarketVbox/MarketInfo/MarketName")
@onready var playerCashDisplay = get_node("PlayerStats/PlayerCashDisplay")
@onready var playerSharesDisplay = get_node("PlayerStats/PlayerSharesDisplay")
@onready var orderVisualizer = get_node("PlayerActionsHBox/OrderVisualizer")
@onready var nextOrderDisplay = get_node("PlayerActionsHBox/NextOrderDisplay")

signal increase_share
signal decrease_share

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_updateCashAndShares(Order.new(0))
	var sfxManager = get_tree().get_root().get_node_or_null('SFXManager')
	if sfxManager:
		#button hover sfx
		$PlayerActionsHBox/PlayerActionsVBox/Buy.mouse_entered.connect(sfxManager._on_button_hovered)
		$PlayerActionsHBox/PlayerActionsVBox/Sell.mouse_entered.connect(sfxManager._on_button_hovered)
		$PlayerActionsHBox/PlayerActionsVBox/Hold.mouse_entered.connect(sfxManager._on_button_hovered)
		$PlayerActionsHBox/VBoxContainer/Up.mouse_entered.connect(sfxManager._on_button_hovered)
		$PlayerActionsHBox/VBoxContainer/Down.mouse_entered.connect(sfxManager._on_button_hovered)
		$PlayerActionsHBox/VBoxContainer/Lock.mouse_entered.connect(sfxManager._on_button_hovered)
		
		#specific sfx
		increase_share.connect(sfxManager._on_share_increase)
		decrease_share.connect(sfxManager._on_share_decrease)
		$PlayerActionsHBox/PlayerActionsVBox/Buy.pressed.connect(sfxManager._on_confirm_buy_or_sell)
		$PlayerActionsHBox/PlayerActionsVBox/Sell.pressed.connect(sfxManager._on_confirm_buy_or_sell)
		$PlayerActionsHBox/PlayerActionsVBox/Hold.pressed.connect(sfxManager._on_confirm_hold)
		$PlayerActionsHBox/VBoxContainer/Lock.pressed.connect(sfxManager._on_cash_out)
		
	

func getPlayerOrder() -> Order:
	print("Player quantity: " + str(orderQuantity))
	var nextOrder = Order.new(orderQuantity, playerOrder)
	_updateCashAndShares(nextOrder)
	return nextOrder

func reset(days:int) -> void:
	currentShares = 0
	currentMoney = 100
	graph.reset(days)
	_updateCashAndShares(Order.new(0))
	
func getOrders(prices: Array[int], daysRemaining: int) -> Array[Order]:
	var agentOrders = $AgentPanel.getOrders(prices, daysRemaining)
	agentOrders.push_back(getPlayerOrder())
	return agentOrders

func getCurrentMoney():
	return currentMoney

func setAgents(agentTypes:Array[String]) -> void:
	$AgentPanel.setAgents(agentTypes)
	
func setMarketValue(prices: Array[int], daysRemaining: int) -> void:
	var newVal = prices[prices.size()-1]
	marketVal = newVal
	marketValueDisplay.text = str(marketVal)
	if(daysRemaining >= 0):
		graph.addPoint(newVal)
		getOrders(prices, daysRemaining)
		
func setMarketDescription(marketInfo: Array[String]) -> void:
	marketNameDisplay.text = marketInfo[0]
	$MarketInfoPopup.showInfo(marketInfo[1])

func getFinalStats() -> Array[int]:
	liquidate()
	return [currentMoney - initialMoney, totalSharesBought]
	
func liquidate() -> void:
	if(currentShares > 0):
		currentMoney += (currentShares * marketVal)
		currentShares = 0
	
func _updateCashAndShares(nextOrder: Order) -> void:
	match nextOrder.type:
		Order.OrderType.SELL:
			currentShares -= orderQuantity
			currentMoney += (orderQuantity * marketVal)
		Order.OrderType.BUY:
			currentShares += orderQuantity
			totalSharesBought += orderQuantity
			currentMoney -= (orderQuantity * marketVal)
		Order.OrderType.HOLD:
			pass
	playerCashDisplay.text = str(currentMoney) + " $UDS"
	playerSharesDisplay.text = str(currentShares) + " Shares"
	_setOrderQuantity(0)
	_setOrderType(Order.OrderType.HOLD)
	

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
	elif(orderQuantity > currentShares):
		print("You don't have that many shares!")
	else:
		_setOrderType(Order.OrderType.SELL)

func _on_buy_pressed() -> void:
	print("Buy is pressed!")
	var price = orderQuantity * marketVal
	if(orderQuantity < 1):
		print("Stupid player, you can't buy less than 1 share!")
	elif(price > currentMoney):
		print("You can't afford that!")
	else:
		_setOrderType(Order.OrderType.BUY)

func _on_hold_pressed() -> void:
	print("Hold is pressed!")
	_setOrderType(Order.OrderType.HOLD)

func _setOrderQuantity(quantity:int) -> void:
	orderQuantity = quantity
	nextOrderDisplay.text = str(orderQuantity)
	
func _on_up_pressed() -> void:
	increase_share.emit() #sfx
	_setOrderQuantity(orderQuantity + 1)

func _on_down_pressed() -> void:
	decrease_share.emit() #sfx
	_setOrderQuantity(orderQuantity - 1)

func _on_lock_pressed() -> void:
	emit_signal("locked")

func _on_market_info_mouse_entered() -> void:
	print("MOUSE ENTERED ON MINFO")
	$MarketInfoPopup.position = Vector2(marketNameDisplay.position)
	$MarketInfoPopup.popup()
