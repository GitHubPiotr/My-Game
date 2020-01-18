extends Node2D

func _ready():
	$Fire.set_emitting(true)
	$Smoke.set_emitting(true)
	$Tween.interpolate_property($FireLight, "energy", 0.8, 0.1, $Fire.lifetime, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()

func _on_Timer_timeout():
	queue_free()
