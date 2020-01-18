extends Area2D

var color : Color
var alpha : float = 0.0
const COLOR_BLUE = Color(0,0,1)
const COLOR_RED = Color(1,0,0)

func _ready():
	var duration = 0.8
	var alpha_value = [0.2, 0.8]
	$Tween.interpolate_property(self, "alpha", alpha_value[0], alpha_value[1], duration, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.interpolate_property(self, "alpha", alpha_value[1], alpha_value[0], duration, Tween.TRANS_LINEAR, Tween.EASE_OUT, duration)
	$Tween.start()

func _process(delta):
	$CursorSprite.modulate = color
	$CursorSprite.modulate.a = alpha

func _cannot_place_tower():
	color = COLOR_RED

func _can_place_tower():
	color = COLOR_BLUE
