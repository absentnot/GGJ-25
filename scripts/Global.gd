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
