extends Control
var titlescreen = preload("res://scenes/TitleScreen.tscn")
var playscene_path="res://scenes/main.tscn"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _on_level1_pressed() -> void:
	print("Button pressed")
	Global.level="roundOne"
	get_tree().change_scene_to_file(playscene_path)
	



func _on_level2_pressed() -> void:
	print("Button pressed")
	Global.level="roundTwo"
	get_tree().change_scene_to_file(playscene_path)


func _on_level3_pressed() -> void:
	print("Button pressed")
	Global.level="roundThree"
	get_tree().change_scene_to_file(playscene_path)


func _on_level4_pressed() -> void:
	print("Button pressed")
	Global.level="roundFour"
	get_tree().change_scene_to_file(playscene_path)


func _on_level5_pressed() -> void:
	print("Button pressed")
	Global.level="roundFive"
	get_tree().change_scene_to_file(playscene_path)
	
func _on_back_pressed() -> void:
	
	var new_scene = titlescreen.instantiate()
	get_tree().root.call_deferred("add_child", new_scene)
	queue_free()
