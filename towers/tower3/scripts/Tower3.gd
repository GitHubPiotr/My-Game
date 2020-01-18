extends "res://towers/TowerScript.gd"

var bullet
var enemy

func _init():
	Bullet  = preload("res://towers/tower3/scenes/Bullet.tscn")
	AmmoFx = preload("res://towers/tower3/scenes/AmmoFx.tscn")
	ShootFx = preload("res://towers/tower3/scenes/ShootFx.tscn")
	
	type = "Tower 3"
	tier = "0"
	cost = Game.TOWER3_COST
	radius = Game.TOWER3_RADIUS
	bullet_damage = Game.TOWER3_DAMAGE
	bullet_velocity = Game.TOWER3_BULLET_VELOCITY
	reload_time = Game.TOWER3_RELOAD_TIME
	bullet_pierce = Game.TOWER3_PIERCE
	upgrade = Game.TOWER3_UPGRADE
	slow = Game.TOWER3_SLOW

func _ready():
	bullet = Bullet.instance()
	bullet.init(bullet_damage, bullet_velocity, bullet_pierce)
	var world = get_parent()
	world.add_child(bullet)

func is_tracking():
	var first_on_path = null
	enemy = null
	for area in $Radius.get_overlapping_areas():
		if area.is_in_group("enemy"):
			if first_on_path == null: first_on_path = area
			if area.get_parent().offset > first_on_path.get_parent().offset: first_on_path = area
	if first_on_path != null:
		look_at(first_on_path.global_position)
		enemy = first_on_path
		return true
	else:
		if bullet.points.size() > 1:
			bullet.remove_point(1) 
		return false

func shoot():
	bullet.set_point_position(0, $Barrel.global_position)
	bullet.cast(self, enemy)
	$Animation.play("ShootAnim")

func _upgrade_tower(upgrade_multiplier):
	bullet_damage = Game.TOWER3_DAMAGE * upgrade_multiplier[2]
	radius = Game.TOWER3_RADIUS * upgrade_multiplier[3]
	reload_time = Game.TOWER3_RELOAD_TIME * upgrade_multiplier[4]
	bullet_pierce = Game.TOWER3_PIERCE * upgrade_multiplier[5]
	slow = Game.TOWER3_SLOW * upgrade_multiplier[6]
	$Animation.playback_speed = 2 + float(tier) / 3
	$Radius.set_radius(radius)
	$Timer.set_wait_time(reload_time)
