extends Area2D

var radius
var slow

func init(damage_, radius_, slow_):
	radius = radius_
	slow = slow_

func _ready():
	$CollisionShape2D.shape.radius = 0
	$Tween.interpolate_property($CollisionShape2D.shape, "radius", 10, radius, 1, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()

func _on_Bullet_area_entered(area):
	area.slow(self)

func _on_Tween_tween_completed(object, key):
	queue_free()
