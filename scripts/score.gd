extends Node

signal nextLevel
signal sameLevel
@onready var totalProfit:Label = get_node("VBoxContainer/TotalProfit")
@onready var totalSharesBought:Label = get_node("VBoxContainer/TotalSharesBought")
@onready var crabTitleLabel:Label = get_node("VBoxContainer/CrabTitle")

signal bad_profit
#var menu = preload("res://scenes/TitleScreen.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var sfxManager = get_tree().get_root().get_node_or_null('SFXManager')
	if sfxManager:
		bad_profit.connect(sfxManager._on_bad_profit)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func display(profit:int, sharesBought: int) -> void:
	totalProfit.text = "YOUR TOTAL PROFIT: %d" %profit
	totalSharesBought.text = "TOTAL SHARES BOUGHT: %d" % sharesBought
	var crabTitle
	if(profit < 0):
		bad_profit.emit()
		crabTitle = "Imitation Crab"
	elif(profit < 25):
		bad_profit.emit()
		crabTitle = "Shelled Simpleton"
	elif(profit < 75):
		crabTitle = "Sea-Rated"
	elif(profit < 150):
		crabTitle = "Pinchy Professor"
	else:
		crabTitle = "Crabsolute Genius"
	crabTitleLabel.text = crabTitle
	
	if profit < 25:
		$PlayerCrab.sad()
	elif profit > 75:
		$PlayerCrab.winning()
	else:
		$PlayerCrab.idle()

func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/TitleScreen.tscn")


func _on_next_round_pressed() -> void:
	if Global.isMoneyZero():
		print("GAME FAILED")
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	else:
		emit_signal("nextLevel")


func _on_retry_pressed() -> void:
	emit_signal("sameLevel")
