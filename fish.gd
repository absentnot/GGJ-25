extends TextureRect

var directionLeft: bool = true
var move_speed = 150.0
# Called when the node enters the scene tree for the first time.
func _ready():
	position.y = randi_range(150, 375)
	z_index = randi_range(0, 4)
	
	var randomizedScale = randf_range(0.8,1.2) * (z_index + 3.0) / 4.5 
	scale = Vector2(randomizedScale, randomizedScale)
	
	if directionLeft:
		position.x = 1050
		scale.x *= 1
	else:
		position.x = -175
		scale.x *= -1
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if directionLeft:
		position.x -= move_speed * delta 
	else:
		position.x += move_speed * delta
	
	if position.x > 1250 or position.x < -400:
		queue_free()
