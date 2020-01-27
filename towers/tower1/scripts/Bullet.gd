extends Area2D

var damage
var pierce
var velocity

func init(_damage, _velocity, _pierce):
	pierce = _pierce
	damage = _damage
	velocity = _velocity

func _process(delta):
	var motion = Vector2(cos(self.rotation), sin(self.rotation)) * velocity
	position += motion * delta

func _on_Bullet_area_entered(enemy):
	enemy.hit(self)
	pierce -= 1
	if pierce <= 0: queue_free()

func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
