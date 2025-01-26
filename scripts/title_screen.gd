extends Control
@onready var background_music = $AudioStreamPlayer
@onready var hslider=$VolumeSlider
var master_bus=AudioServer.get_bus_index("Master")
@export var level_scene:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	var music_stream = load("res://assets/sfx/atmosphere_loopable.mp3")
	music_stream.loop = true
	background_music.stream = music_stream
	background_music.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	Global.level="roundOne"
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_settings_pressed() -> void:
	hslider.visible=!hslider.visible

func _on_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(master_bus, value)
	if value == -30:
		AudioServer.set_bus_mute(master_bus,true)
	else:
		AudioServer.set_bus_mute(master_bus,false)
		
