extends Control

@onready var hslider=$VolumeSlider
var master_bus=AudioServer.get_bus_index("Master")
@export var level_scene:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var music_stream = load("res://assets/sfx/atmosphere_loopable.mp3")
	music_stream.loop = true
	
	var sfxManager = get_tree().get_root().get_node_or_null('SFXManager')
	if sfxManager:
		$CenterContainer/VBoxContainer/Button.mouse_entered.connect(sfxManager._on_button_hovered)
		$CenterContainer/VBoxContainer/Button.pressed.connect(sfxManager._on_start_pressed)
		$CenterContainer/VBoxContainer/Button2.mouse_entered.connect(sfxManager._on_button_hovered)

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_settings_pressed() -> void:
	hslider.visible=!hslider.visible

func _on_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(master_bus, value)
	if value == -30:
		AudioServer.set_bus_mute(master_bus,true)
	else:
		AudioServer.set_bus_mute(master_bus,false)
		
