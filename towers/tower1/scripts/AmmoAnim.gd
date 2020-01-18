extends Node2D

func _ready():
	$Detalis.set_emitting(true)
	$Ammo.set_emitting(true)

func _on_Timer_timeout():
	$AmmoFallsSound.play()

func _on_AmmoFallsSound_finished():
	queue_free()
