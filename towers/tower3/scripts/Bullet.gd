extends Line2D

var damage

func _ready():
	var duration = 1
	$Tween.interpolate_property(self, "width", 8, 16, duration, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.interpolate_property(self, "width", 16, 8, duration, Tween.TRANS_LINEAR, Tween.EASE_OUT, duration)
	$Tween.start()

func init(damage_, velocity_, pierce_):
	damage = damage_

func cast(tower, collider):
	if points.size() > 1: remove_point(1)
	add_point(collider.global_position)
	collider.hit(self)
