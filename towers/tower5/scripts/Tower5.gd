extends "res://towers/TowerScript.gd"

func _init():
	Bullet  = preload("res://towers/tower5/scenes/Bullet.tscn")
	AmmoFx = preload("res://towers/tower5/scenes/AmmoFx.tscn")
	ShootFx = preload("res://towers/tower5/scenes/ShootFx.tscn")
	
	type = "Tower 5"
	tier = "0"
	cost = Game.TOWER5_COST
	radius = Game.TOWER5_RADIUS
	bullet_damage = Game.TOWER5_DAMAGE
	bullet_velocity = Game.TOWER5_BULLET_VELOCITY
	reload_time = Game.TOWER5_RELOAD_TIME
	bullet_pierce = Game.TOWER5_PIERCE
	upgrade = Game.TOWER5_UPGRADE
	slow = Game.TOWER5_SLOW

func _upgrade_tower(upgrade_multiplier):
	bullet_damage = Game.TOWER5_DAMAGE * upgrade_multiplier[2]
	radius = Game.TOWER5_RADIUS * upgrade_multiplier[3]
	reload_time = Game.TOWER5_RELOAD_TIME * upgrade_multiplier[4]
	bullet_pierce = Game.TOWER5_PIERCE * upgrade_multiplier[5]
	slow = Game.TOWER5_SLOW * upgrade_multiplier[6]
	$Animation.playback_speed = 2 + float(tier) / 3
	$Radius.set_radius(radius)
	$Timer.set_wait_time(reload_time)

