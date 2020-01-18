extends Node2D

onready var Level = get_tree().get_root().get_node("Level1")

var Bullet = null
var AmmoFx = null
var ShootFx = null

var type
var tier
var cost
var experience
var upgrade

var is_reloaded
var radius
var reload_time
var slow
var bullet_pierce
var bullet_damage
var bullet_velocity

signal open_tower_panel

func _init():
	experience = 0
	is_reloaded = true

func _ready():
	$Timer.set_wait_time(reload_time)
	$Radius.set_radius(radius)
	look_at(Vector2.ZERO)
	Level._change_gold(-cost)
	connect("open_tower_panel", Level.get_node("Control/TowerPanel"), "_open_tower_panel")

func _process(delta):
	if is_tracking() and is_reloaded:
		shoot()
		shoot_fx()
		reload()

func is_tracking():
	var first_on_path = null
	for area in $Radius.get_overlapping_areas():
		if area.is_in_group("enemy"):
			if first_on_path == null: first_on_path = area
			if area.get_parent().offset > first_on_path.get_parent().offset: first_on_path = area
	if first_on_path != null:
		look_at(first_on_path.global_position)
		return true
	else: return false

func reload():
	is_reloaded = false
	$Timer.start()

func _on_Timer_timeout():
	is_reloaded = true

func shoot():
	var bullet = Bullet.instance()
	bullet.init(bullet_damage, bullet_velocity, bullet_pierce)
	bullet.global_position = $Barrel.global_position
	bullet.global_rotation = rotation
	var world = get_parent()
	world.add_child(bullet)

func shoot_fx():
	var shoot_fx = ShootFx.instance()
	shoot_fx.global_position = $Barrel.global_position
	shoot_fx.rotation_degrees = rotation_degrees
	get_parent().add_child(shoot_fx)
	
	var ammo_fx = AmmoFx.instance()
	ammo_fx.global_position = $AmmoBox.global_position
	ammo_fx.rotation_degrees = rotation_degrees
	get_parent().add_child(ammo_fx)
	
	$Animation.play("ShootAnim")
	$ShootSound.play()

func _on_Tower_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		emit_signal("open_tower_panel", self)
