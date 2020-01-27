extends "res://towers/TowerScript.gd"

func _init():
	Bullet  = preload("res://towers/tower1/scenes/Bullet.tscn")
	AmmoFx = preload("res://towers/tower1/scenes/AmmoFx.tscn")
	ShootFx = preload("res://towers/tower1/scenes/ShootFx.tscn")
	
	type = "Tower 1"
	tier = "0"
	cost = Game.TOWER1_COST
	radius = Game.TOWER1_RADIUS
	bullet_damage = Game.TOWER1_DAMAGE
	bullet_velocity = Game.TOWER1_BULLET_VELOCITY
	reload_time = Game.TOWER1_RELOAD_TIME
	bullet_pierce = Game.TOWER1_PIERCE
	upgrade = Game.TOWER1_UPGRADE
	slow = Game.TOWER1_SLOW

func _upgrade_tower(upgrade_multiplier):
	bullet_damage = int(Game.TOWER1_DAMAGE * upgrade_multiplier[2])
	radius = Game.TOWER1_RADIUS * upgrade_multiplier[3]
	reload_time = Game.TOWER1_RELOAD_TIME * upgrade_multiplier[4]
	bullet_pierce = Game.TOWER1_PIERCE * upgrade_multiplier[5]
	slow = Game.TOWER1_SLOW * upgrade_multiplier[6]
	$Animation.playback_speed = 2 + float(tier) / 3
	$Radius.set_radius(radius)
	$Timer.set_wait_time(reload_time)
