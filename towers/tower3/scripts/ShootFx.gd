extends Node2D

func _ready():
	$Particles2D.emitting = true
	$Timer.start()

func _on_Timer_timeout():
	queue_free()
