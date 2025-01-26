extends Node

var hold: Texture = preload("res://assets/hold.png")
var sell: Texture = preload("res://assets/sell.png")
var buy: Texture= preload("res://assets/buy.png")
var sprite: Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite = Sprite2D.new()
	sprite.scale = Vector2(.25, .25)
	_set_texture_and_refit(hold)
	add_child(sprite)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func updateOrder(nextOrderType: Order.OrderType) -> void:
	match nextOrderType:
		Order.OrderType.SELL:
			_set_texture_and_refit(sell)
		Order.OrderType.BUY:
			_set_texture_and_refit(buy)
		Order.OrderType.HOLD:
			_set_texture_and_refit(hold)

func _set_texture_and_refit(texture) -> void:
	sprite.texture = texture
	var size = sprite.texture.get_size()
	var offset = Vector2(size.x / 2, size.y / 2)
	sprite.offset = offset
	#sprite.offset = size/2
