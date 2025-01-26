extends PopupPanel

signal tutorialEnd
var state = 0
@onready var info = get_node("VBoxContainer/Info")
@onready var backButton = get_node("VBoxContainer/HBoxContainer/Back")
@onready var nextButton = get_node("VBoxContainer/HBoxContainer/Next")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_updateText()
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	


func _nextState(newState: int) -> void:
	state = newState
	_updateText()
	
func _updateText() -> void:
	var infoText
	match state:
		0:
			position = Vector2(400,200)
			backButton.visible = false
			infoText = "Welcome to "+Global.gametitle+"! This is an exciting game of market pricing and crabs?\nIn "+Global.gametitle+", you will issue BUY/SELL/HOLD orders to try to maximize profits in different markets before the bubble bursts!"
		1:
			position = Vector2(400,50)
			backButton.visible = true
			infoText = "This display will show the current price and price history in the current market. \n A red line means the price is going down, a green line - it is going up, and a purple line is a constant price."
		2:
			position = Vector2(600,25)
			infoText = "Here, your current cash (in $UDS, of course) and shares are shown. You cannot sell shares you don't have, and you can't buy shares you can't afford!"
		3:
			position = Vector2(600,300)
			infoText = "At the end of each day, your order will be locked in to this quantity and order type.\n You can change the quantity with the UP/DOWN arrows here, and the order type with the BUY/SELL/HOLD buttons.\n Pressing LOCK! will immediately issue the order and advance the day, so be careful!"
		4:
			position = Vector2(600, 200)
			infoText = "Some markets are hotly contested by other young crab traders trying to capitalize on the bubbles! \n You can see other traders on these side panels. \n The orders they will issue at end of day are shown next to them. \n Hovering over a trader will tell you their trading habits."
		5:
			position = Vector2(50, 100)
			nextButton.text = "NEXT"
			infoText = "Markets do not exist in isolation! Some particularly unstable bubbles may be influenced by the actions of the traders. \n The market information will be displayed here."
		6: 
			position = Vector2(400,200)
			nextButton.text = "LET'S PLAY!"
			infoText = "At the end of 5 days of trading, your shares will be liquidated and profits calculated. \n You will earn a CRAB TITLE based on your profits, and will have the opportunity to retry or advance to the next round.\n Good luck!"
		7:
			infoText = "Behold! A ghost panel!"
			tutorialEnd.emit()
	if info:
		info.text = infoText

func _on_back_pressed() -> void:
	_nextState(state-1)
	pass # Replace with function body.


func _on_next_pressed() -> void:
	_nextState(state+1)
	pass # Replace with function body.


	


 # Replace with function body.
