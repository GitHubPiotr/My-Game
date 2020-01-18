extends Area2D

const Explosion = preload("res://towers/tower2/scenes/Explosion.tscn")

var damage
var velocity
var pierce

func _ready():
	damage = Game.TOWER2_DAMAGE
	pierce = Game.TOWER2_PIERCE
	velocity = Game.TOWER2_BULLET_VELOCITY

func init(damage_, velocity_, pierce_):
	pierce = pierce_
	damage = damage_
	velocity = velocity_

func _process(delta):
	var motion = Vector2(cos(self.rotation), sin(self.rotation)) * velocity
	position += motion * delta

func _on_Bullet_area_entered(enemy):
	call_deferred("explosion")
	for enemy in $ExplosionArea.get_overlapping_areas():
		if enemy.is_in_group("enemy"): enemy.hit(self)
	queue_free()

func explosion():
	var explosion = Explosion.instance()
	explosion.global_position = global_position
	get_parent().add_child(explosion)

func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
