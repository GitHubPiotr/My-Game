extends Node2D

func _ready():
	$Particles2D.set_emitting(true)
	$Particles2D2.set_emitting(true)
	$Tween.interpolate_property($FireLight, "modulate", Color(1,1,0.8,0.4), Color(1,1,0.8,0.0), $Particles2D.lifetime, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()

func _on_Timer_timeout():
	queue_free()
