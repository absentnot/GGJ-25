extends Node
var level: String

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
	var roundOne = root.get_node("Main").get_node_or_null("RoundOne") if root.get_node_or_null("Main") != null else null
	if roundOne:
		if len(roundOne.getAgentTypes()) > 0:
			return "true"
		else:
			return "false"
	return "false"

func isMoneyZero():
	var root = get_tree().get_root()
	var hud =  root.get_node("Main").get_node_or_null("HUD") if root.get_node_or_null("Main") != null else null
	if hud:
		if hud.getCurrentMoney() <= 0:
			return "true"
		else:
			return "false"
	return "false"

func isLastDay():
	var root = get_tree().get_root()
	var roundOne = root.get_node("Main").get_node_or_null("RoundOne") if root.get_node_or_null("Main") != null else null
	if roundOne:
		if roundOne.isLastDay():
			return "true"
		else:
			return "false"
	return "false"
