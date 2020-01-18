extends Area2D

var damage
var pierce
var velocity
var collider

func _ready():
	damage = Game.TOWER4_DAMAGE
	pierce = Game.TOWER4_PIERCE
	velocity = Game.TOWER4_BULLET_VELOCITY

func init(_damage, _pierce, _velocity):
	pierce = _pierce
	damage = _damage
	velocity = _velocity

func anim_to(_collider):
	collider = _collider
	$Tween.interpolate_property(self, "global_position", global_position, collider.global_position, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()

func _on_Tween_tween_completed(object, key):
	$Tween/Timer.start()
	if is_instance_valid(collider): collider.hit(self)

func _on_Timer_timeout():
	queue_free()
