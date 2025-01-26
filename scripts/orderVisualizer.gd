extends TextureRect

class_name OrderVisualizer


var hold: Texture = preload("res://assets/hold.png")
var sell: Texture = preload("res://assets/sell.png")
var buy: Texture= preload("res://assets/buy.png")
var sprite: TextureRect
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_stretch_mode(TextureRect.STRETCH_SCALE)
	set_expand_mode(TextureRect.EXPAND_FIT_WIDTH)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func updateOrder(nextOrderType: Order.OrderType) -> void:
	match nextOrderType:
		Order.OrderType.SELL:
				set_texture(sell)
		Order.OrderType.BUY:
				set_texture(buy)
		Order.OrderType.HOLD:
				set_texture(hold)
