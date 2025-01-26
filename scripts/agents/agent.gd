extends HBoxContainer

class_name Agent

var currentShares: int = 0
var currentCapital: int = 100
var spriteName: String
var orderVisualizer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("AgentGroup")
	var sprite = TextureRect.new()
	sprite.set_texture(load("res://assets/" + spriteName))
	sprite.set_stretch_mode(TextureRect.STRETCH_SCALE)
	sprite.set_expand_mode(TextureRect.EXPAND_FIT_WIDTH)
	add_child(sprite)
	orderVisualizer = OrderVisualizer.new()
	add_child(orderVisualizer)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func decide(prices: Array[int], daysRemaining: int) -> Order:
	var nextOrder = _next_order(prices, daysRemaining)
	orderVisualizer.updateOrder(nextOrder.type)
	return nextOrder

func _next_order(prices: Array[int], daysRemaining: int) -> Order:
	return Order.new(0)
