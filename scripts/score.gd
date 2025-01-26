extends Node

signal nextLevel
@onready var totalProfit:Label = get_node("VBoxContainer/TotalProfit")
@onready var totalSharesBought:Label = get_node("VBoxContainer/TotalSharesBought")
@onready var crabTitleLabel:Label = get_node("VBoxContainer/CrabTitle")
#var menu = preload("res://scenes/TitleScreen.tscn")
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

func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/TitleScreen.tscn")


func _on_next_round_pressed() -> void:
	emit_signal("nextLevel")
