extends "res://towers/TowerScript.gd"

func _init():
	Bullet  = preload("res://towers/tower4/scenes/Bullet.tscn")
	AmmoFx = preload("res://towers/tower4/scenes/AmmoFx.tscn")
	ShootFx = preload("res://towers/tower4/scenes/ShootFx.tscn")

	type = "Tower 4"
	tier = "0"
	cost = Game.TOWER4_COST
	radius = Game.TOWER4_RADIUS
	bullet_damage = Game.TOWER4_DAMAGE
	bullet_velocity = Game.TOWER4_BULLET_VELOCITY
	reload_time = Game.TOWER4_RELOAD_TIME
	bullet_pierce = Game.TOWER4_PIERCE
	upgrade = Game.TOWER4_UPGRADE
	slow = Game.TOWER4_SLOW

func shoot():
	yield(get_tree(), "idle_frame")
	var collider = $RayCast2D.get_collider()
	if collider == null: return false
	var bullet = Bullet.instance()
	bullet.init(bullet_damage, bullet_velocity, bullet_pierce)
	bullet.global_position = $Barrel.global_position
	bullet.global_rotation = rotation
	var world = get_parent()
	world.add_child(bullet)
	bullet.anim_to(collider)

func _upgrade_tower(upgrade_multiplier):
	bullet_damage = Game.TOWER4_DAMAGE * upgrade_multiplier[2]
	radius = Game.TOWER4_RADIUS * upgrade_multiplier[3]
	reload_time = Game.TOWER4_RELOAD_TIME * upgrade_multiplier[4]
	bullet_pierce = Game.TOWER4_PIERCE * upgrade_multiplier[5]
	slow = Game.TOWER4_SLOW * upgrade_multiplier[6]
	$Animation.playback_speed = 2 + float(tier) / 3
	$Radius.set_radius(radius)
	$Timer.set_wait_time(reload_time)
