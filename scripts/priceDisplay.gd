extends CanvasItem

var points: Array[Vector2]
var maxDays: int = 5
var maxPrice: int = 200
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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func addPoint(newMarketPrice: int) -> void:
	var prevPoint = Vector2(-widthStep,0)
	var numPoints = points.size()
	if(numPoints > 0):
		prevPoint = points[numPoints-1]
	var stepVector = Vector2(widthStep, (newMarketPrice - prevPoint.y))
	points.push_back(prevPoint + stepVector)
	queue_redraw()
	
func _draw():
	var heightMax = 500
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
		draw_circle(point, dotRadius, black)
		if(i > 0):
			var thisY = point.y
			var lineColor = Color.BLUE_VIOLET
			if(prevY > thisY):
				lineColor = red
			if(prevY < thisY):
				lineColor = green
			draw_line(points[i-1], point, lineColor, lineWidth)
		prevY = point.y
