extends Node
var level: String

func getCurrentMusicContext():
	var root = get_tree().get_root()
	var isTitleScreen = root.get_node("TitleScreen") != null
	if isTitleScreen:
		return "intro"
	elif get_tree().get_root().get_node("Main"):
		return "main"
	return "intro"
	
func getAgentsOrNot():
	return "true"
	var root = get_tree().get_root()
	var roundOne = root.get_node("roundOne")
	if roundOne:
		return len(roundOne.getAgentTypes()) > 0
		
