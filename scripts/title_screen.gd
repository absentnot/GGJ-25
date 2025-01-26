extends Control
@onready var background_music = $AudioStreamPlayer
@onready var hslider=$VolumeSlider
var master_bus=AudioServer.get_bus_index("Master")
#@onready var level_scene=load("res://scenes/LevelSelect.tscn")
@export var level_scene:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	var music_stream = load("res://assets/start + regular game loop.mp3")
	music_stream.loop = true
	background_music.stream = music_stream
	background_music.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	#get_tree().change_scene_to_file("res://LevelSelect.tscn")
	print(level_scene)
	var level_instance=level_scene.instantiate()
	add_child(level_instance)
	

func _on_settings_pressed() -> void:
	hslider.visible=!hslider.visible





func _on_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(master_bus, value)
	if value == -30:
		AudioServer.set_bus_mute(master_bus,true)
	else:
		AudioServer.set_bus_mute(master_bus,false)
		
