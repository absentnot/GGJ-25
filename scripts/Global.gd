extends Node
var level: int = 0
var gametitle: String ='Bubble Brokers' 
var roundNumbers: Array[String] = ['One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven']

func getCurrentMusicContext():
	var root = get_tree().get_root()
	var isTitleScreen = root.get_node_or_null("TitleScreen") != null
	if isTitleScreen:
		return "intro"
	elif get_tree().get_root().get_node_or_null("Main"):
		return "main"
	return "intro"
	
func getAgentsOrNot():
	var root = get_tree().get_root()
	for roundNumber in roundNumbers:
		var round = root.get_node("Main").get_node_or_null("Round"+roundNumber) if root.get_node_or_null("Main") != null else null
		if round:
			return len(round.getAgentTypes()) > 0
	return false

func isMoneyZero():
	var root = get_tree().get_root()
	var hud =  root.get_node("Main").get_node_or_null("HUD") if root.get_node_or_null("Main") != null else null
	if hud:
		#print(hud.getCurrentMoney() <  hud.getMarketValue())
		if hud.getCurrentMoney() < hud.getMarketValue():
			return true
		else:
			return false
	return false

func isLastDay():
	var root = get_tree().get_root()
	for roundNumber in roundNumbers:
		var round = root.get_node("Main").get_node_or_null("Round"+roundNumber) if root.get_node_or_null("Main") != null else null
		if round:
			return round.isLastDay()
	return false
