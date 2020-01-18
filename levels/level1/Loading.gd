extends Sprite 

func _ready():
	visible = true

# warning-ignore:unused_argument
func _process(delta):
	$ProgressBar.value += $Timer.wait_time

func _on_Timer_timeout():
	$Tween.interpolate_property(self, "modulate", Color(1,1,1,1), Color(1,1,1,0), 1, Tween.TRANS_CIRC, Tween.EASE_IN)
	$Tween.start()
