extends CanvasItem

var points: Array[Vector2]
var maxDays: int = 5
var maxPrice: int = 200
var minPrice: int = 0
@export var widthStep: int = 100
@export var heightStep: int = 50
@export var dotRadius = 10
@export var lineWidth = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	points = []
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func addPoint(newMarketPrice: int) -> void:
	var prevPoint = Vector2(0,0)
	var numPoints = points.size()
	if(numPoints > 0):
		prevPoint = points[numPoints-1]
	var stepVector = Vector2(widthStep, (newMarketPrice - prevPoint.y))
	points.push_back(prevPoint + stepVector)
	queue_redraw()
	
func _draw():
	var prevY = 0
	for i in range(points.size()):
		var point = points[i]
		draw_circle(point, dotRadius, Color.BLACK)
		if(i > 0):
			var thisY = point.y
			var lineColor = Color.BLACK
			if(prevY > thisY):
				lineColor = Color.RED
			if(prevY < thisY):
				lineColor = Color.GREEN
			draw_line(points[i-1], point, lineColor, lineWidth)
		prevY = point.y
			
	#draw_line(Vector2(0,0), Vector2(100,100), Color.RED)
