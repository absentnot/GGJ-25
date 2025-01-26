extends Node


@onready var totalProfit:Label = get_node("VBoxContainer/TotalProfit")
@onready var totalSharesBought:Label = get_node("VBoxContainer/TotalSharesBought")
@onready var crabTitleLabel:Label = get_node("VBoxContainer/CrabTitle")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func display(profit:int, sharesBought: int) -> void:
	totalProfit.text = "YOUR TOTAL PROFIT: %d" %profit
	totalSharesBought.text = "TOTAL SHARES BOUGHT: %d" % sharesBought
	var crabTitle
	if(profit < 0):
		crabTitle = "Imitation Crab"
	elif(profit < 25):
		crabTitle = "Shelled Simpleton"
	elif(profit < 75):
		crabTitle = "Sea-Rated"
	elif(profit < 150):
		crabTitle = "Pinchy Professor"
	else:
		crabTitle = "Crabsolute Genius"
	crabTitleLabel.text = crabTitle
