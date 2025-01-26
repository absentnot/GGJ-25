extends Control

class_name Agent

var currentShares: int = 0
var currentCapital: int = 100
var spriteName: String
@export var agentType: String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var coolLabel = Label.new()
	coolLabel.text = agentType
	print("Adding  a label : named " + agentType)
	add_child(coolLabel)
	#var sprite = TextureRect.new()
	#### TODO: Andrew, I guess make this load the real sprite lol
	#sprite.set_texture(load("res://assets/art/%s.png" % agentType))
	#add_child(sprite)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func decide(prices: Array[int], daysRemaining: int) -> Order:
	var nextOrder: Order
	match agentType:
		"thoth":
			nextOrder =  _thothDecide(prices)
		"gretchen":
			nextOrder =  _gretchenDecide(prices)
		"shellstrong":
			nextOrder =  _shellstrongDecide(daysRemaining)
		"snowcrab":
			nextOrder =  _snowcrabDecide()
		_:
			nextOrder = Order.new(0)
	$OrderVisualizer.updateOrder(nextOrder.type)
	return nextOrder

func _thothDecide(prices: Array[int]) -> Order:
	var numPrices = prices.size()
	# If today is the first day, we do not buy.
	if(numPrices < 2):
		return Order.new(0)
	var lastPrice = prices[numPrices-1]
	var twoPricesAgo = prices[numPrices-2]
	# If the price dropped and the new value is less than half the old, buy.
	if (lastPrice < twoPricesAgo and  (lastPrice * 2) < twoPricesAgo):
		return Order.new(10, Order.OrderType.BUY)
	# Otherwise, we do not buy.
	return Order.new(0)

func _gretchenDecide(prices: Array[int]) -> Order:
	var currentDayEven = prices.size() % 2 == 0
	if currentDayEven:
		return Order.new(10, Order.OrderType.BUY)
	return Order.new(0)
	
func _shellstrongDecide(daysRemaining: int) -> Order:
	print("Shellstronging! %d " % daysRemaining)
	if daysRemaining == 0:
		print("Shellstorng says buy!")
		return Order.new(10, Order.OrderType.BUY)
	return Order.new(0)
	
func _snowcrabDecide() -> Order:
	return Order.new(10, Order.OrderType.SELL)


func _on_mouse_entered() -> void:
	$AgentInfoTooltip.position = Vector2(get_global_mouse_position())
	$AgentInfoTooltip.showInfo(getAgentInfo())
	$AgentInfoTooltip.popup()
	
func getAgentInfo() -> String:
	var info: String
	match agentType:
		"thoth":
			info =  "Risky Thoth buys on sharp price drops."
		"gretchen":
			info =  "Gretchen buys every even tick. Stupid."
		"shellstrong":
			info =  "Senator Shellstrong buys at the very last second."
		"snowcrab":
			info =  "Snowcrab never buys! SELL SELL SELL!"
		_:
			info = "You have discovered the rare ghost crab!"
	return info
