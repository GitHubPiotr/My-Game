extends Node2D

func _ready():
	$Smoke.emitting = true
	$Explosion1.emitting = true
	$Explosion2.emitting = true
	$Tween.interpolate_property($FireLight, "energy", 2, 0, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()

func _on_Timer_timeout():
	queue_free()
