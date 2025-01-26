extends Node
@onready var atmosphere_player = $AtmospherePlayer
@onready var sfx_player = $SfxPlayer

var sfx_paths = [
	"res://assets/sfx/bubbles.mp3",
	"res://assets/sfx/button_hover.mp3",
	"res://assets/sfx/cash_out.mp3",
	"res://assets/sfx/confirm_buy_or_sell.mp3",
	"res://assets/sfx/decrease_share.mp3",
	"res://assets/sfx/increase_share.mp3",
	"res://assets/sfx/menu_button_select.mp3",
	"res://assets/sfx/price_go_down.mp3",
	"res://assets/sfx/price_go_up.mp3",
	"res://assets/sfx/round_start.mp3",
]

func load_sfx():
	for path in sfx_paths:
		var loaded_sfx = load(path)
		var sfx_player = AudioStreamPlayer.new()
		var name_with_file = path.split('/')[-1]
		sfx_player.name = name_with_file.substr(0, len(name_with_file)-4) #remove _mp3
		$SfxPlayer.add_child(sfx_player)
		sfx_player.stream = loaded_sfx

func _ready():
	var music_stream = load("res://assets/sfx/atmosphere_loopable.mp3")
	load_sfx()
	#button_hover = load("res://assets/sfx/button_hover.mp3")
	music_stream.loop = true
	atmosphere_player.volume_db = 20
	atmosphere_player.stream = music_stream
	atmosphere_player.play()

func _on_button_hovered():
	$SfxPlayer/button_hover.play()
	
func _on_start_pressed():
	$SfxPlayer/menu_button_select.play()
	
func _on_round_start():
	$SfxPlayer/round_start.play()
	
func _on_share_increase():
	$SfxPlayer/increase_share.play()
	
func _on_share_decrease():
	$SfxPlayer/decrease_share.play()

func _on_confirm_buy_or_sell():
	$SfxPlayer/confirm_buy_or_sell.play()
	
func _on_confirm_hold():
	$SfxPlayer/menu_button_select.play()

func _on_cash_out():
	$SfxPlayer/cash_out.play()
