extends Node2D

func _ready():
	$Particles2D.set_emitting(true)

func _on_Timer_timeout():
	queue_free()
