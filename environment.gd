@tool
extends Control

var fishDict = {
	0: "res://assets/art/clownfish.png",
	1: "res://assets/art/corycats.png",
	2: "res://assets/art/dory.png",
	3: "res://assets/art/jellyfish.png",
	4: "res://assets/art/shark.png",
}

var spawnTimeRangeMin = 1.0
var spawnTimeRangeMax = 10.0

func _ready():
	pass # Replace with function body.


func _on_timer_timeout():
	$Timer.wait_time = randf_range(spawnTimeRangeMin, spawnTimeRangeMax)
	var fish = load("res://scenes/fish.tscn").instantiate()
	fish.texture = load(fishDict[randi_range(0,4)])
	fish.directionLeft = bool(randi_range(0,1))
	
	add_child(fish)
	
	print("SPAWN FISH")
