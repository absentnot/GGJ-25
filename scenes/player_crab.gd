extends Control

func _ready():
	idle()

func winning():
	$AnimationPlayer.play("winning")
	
	
func sad():
	$AnimationPlayer.play("sad")
	
func nervous():
	$AnimationPlayer.play("nervous")
	
func idle():
	$AnimationPlayer.play("idle")
