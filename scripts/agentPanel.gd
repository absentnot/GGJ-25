extends VBoxContainer

var agents: Array[Agent]
var agentScene: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	agentScene = load("res://scenes/agentScene.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setAgents(agentNames: Array[String]):
	for n in agents:
		n.queue_free()
		agents = []
	for agent in agentNames:
		var newScene = agentScene.instantiate()
		newScene.agentType = agent
		add_child(newScene)
		agents.push_back(newScene)
	
func getOrders(prices: Array[int], daysRemaining: int) -> Array[Order]:
	var ret: Array[Order] = []
	for each in agents:
		ret.push_back(each.decide(prices, daysRemaining))
	return ret
