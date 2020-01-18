extends "res://towers/TowerScript.gd"

const ShootFx2 = preload("res://towers/tower2/scenes/ShootFx2.tscn")

func _init():
	Bullet  = preload("res://towers/tower2/scenes/Bullet.tscn")
	AmmoFx = preload("res://towers/tower2/scenes/AmmoFx.tscn")
	ShootFx = preload("res://towers/tower2/scenes/ShootFx.tscn")
	
	type = "Tower 2"
	tier = "0"
	cost = Game.TOWER2_COST
	radius = Game.TOWER2_RADIUS
	bullet_damage = Game.TOWER2_DAMAGE
	bullet_velocity = Game.TOWER2_BULLET_VELOCITY
	reload_time = Game.TOWER2_RELOAD_TIME
	bullet_pierce = Game.TOWER2_PIERCE
	upgrade = Game.TOWER2_UPGRADE
	slow = Game.TOWER2_SLOW

func shoot_fx():
	.shoot_fx()
	var shoot_fx2 = ShootFx2.instance()
	shoot_fx2.global_position = $Back.global_position
	shoot_fx2.rotation_degrees = rotation_degrees
	get_parent().add_child(shoot_fx2)

func _upgrade_tower(upgrade_multiplier):
	bullet_damage = Game.TOWER2_DAMAGE * upgrade_multiplier[2]
	radius = Game.TOWER2_RADIUS * upgrade_multiplier[3]
	reload_time = Game.TOWER2_RELOAD_TIME * upgrade_multiplier[4]
	bullet_pierce = Game.TOWER2_PIERCE * upgrade_multiplier[5]
	slow = Game.TOWER2_SLOW * upgrade_multiplier[6]
	$Animation.playback_speed = 2 + float(tier) / 2
	$Radius.set_radius(radius)
	$Timer.set_wait_time(reload_time)
