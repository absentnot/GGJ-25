extends CanvasItem

var points: Array[Vector2]
var heightMax = 500
var maxDays: int = 5
var maxPriceSeen: int = 100
var maxPrice: int = maxPriceSeen * 2
var minPrice: int = 0
@export var widthStep: int = 100
@export var heightStep: int = 50
@export var dotRadius = 10
@export var lineWidth = 6
var black = Color.BLACK
var opaqueGrey = Color(0.827451, 0.827451, 0.827451, .4)
var veryOpaqueGrey =  Color(0.827451, 0.827451, 0.827451, .2)
var red = Color.RED
var green = Color.GREEN
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	points = []
	pass # Replace with function body.
	
func reset(days: int) -> void:
	points =[]
	maxDays = days
	maxPriceSeen = 100
	maxPrice = maxPriceSeen * 2
	minPrice =  0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func addPoint(newMarketPrice: int) -> void:
	var prevPoint = Vector2(-widthStep,0)
	var numPoints = points.size()
	if(numPoints > 0):
		prevPoint = points[numPoints-1]
	# Determine if we need to resize
	if(newMarketPrice > maxPrice):
		_resize(newMarketPrice)
	elif(newMarketPrice > maxPriceSeen):
		maxPriceSeen = maxPrice
	# We map from price space into pixel space
	var heightRatio = float(heightMax)/float(maxPrice)
	var rescaledY = newMarketPrice * (heightRatio)
	var newPoint = Vector2(prevPoint.x + widthStep,heightMax - rescaledY)
	points.push_back(newPoint)
	var label = Label.new()
	label.text = str(newMarketPrice)
	label.set_position(Vector2(prevPoint.x + widthStep,heightMax + 25))
	add_child(label)
	queue_redraw()

func _resize(newMarketPrice: int) -> void:
	var prevMaxPrice = maxPrice
	var delta = newMarketPrice - maxPrice
	maxPrice = newMarketPrice * 2
	maxPriceSeen = newMarketPrice
	for i in range(points.size()):
		var originalRatio = -1 * (points[i].y - heightMax)
		var newRatio = originalRatio * (float(prevMaxPrice) / float(maxPrice))
		points[i].y = (heightMax - newRatio)
	
func _draw():
	var widthMax = maxDays * widthStep
	draw_line(Vector2(0,heightMax), Vector2(0, 0), black, 8)
	draw_line(Vector2(0,heightMax), Vector2(widthMax, heightMax), black, 8)
	for i in range(widthStep, widthMax, widthStep):
		# Draw vertical grid lines every widthstep 
		draw_line(Vector2(i, 0), Vector2(i, heightMax),  opaqueGrey, 2)
	for i in range(heightStep, heightMax, heightStep):
		# draw horizontal grid lines every heightstep
		draw_line(Vector2(0, i), Vector2(widthMax, i),  veryOpaqueGrey, 2)
	var prevY = 0
	for i in range(points.size()):
		var point = points[i]
		var thisY = point.y
		var lineColor = Color.BLUE_VIOLET
		if(prevY < thisY):
			lineColor = red
		if(prevY > thisY):
			lineColor = green
		if(i > 0):
			# The logic here is inverted, since points are stored as max - price.
			draw_line(points[i-1], point, lineColor, lineWidth)
			draw_circle(point, dotRadius, lineColor)
		else:
			draw_circle(point,dotRadius, Color.BLUE_VIOLET)
		prevY = point.y
