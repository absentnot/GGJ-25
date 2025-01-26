extends Control
var titlescreen = preload("res://scenes/TitleScreen.tscn")
var playscene_path="res://scenes/main.tscn"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_level1_pressed() -> void:
	print("Button pressed")
	Global.level=1
	get_tree().change_scene_to_file(playscene_path)
	



func _on_level2_pressed() -> void:
	print("Button pressed")
	Global.level=2
	get_tree().change_scene_to_file(playscene_path)


func _on_level3_pressed() -> void:
	print("Button pressed")
	Global.level=3
	get_tree().change_scene_to_file(playscene_path)


func _on_level4_pressed() -> void:
	print("Button pressed")
	Global.level=4
	get_tree().change_scene_to_file(playscene_path)


func _on_level5_pressed() -> void:
	print("Button pressed")
	Global.level=5
	get_tree().change_scene_to_file(playscene_path)
	
func _on_back_pressed() -> void:
	
	var new_scene = titlescreen.instantiate()
	get_tree().root.call_deferred("add_child", new_scene)
	queue_free()
