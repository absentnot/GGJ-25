extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	#if !Global.gameWon:
		#$CenterContainer/VBoxContainer/RichTextLabel.text = "[wave amp=50.0 freq=2.0 connected=1][center]TOO BROKE TO CONTINUE 🦀[/center][/wave]"
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/TitleScreen.tscn")
