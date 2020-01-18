extends Area2D

onready var Hp_bar = get_node("ProgressBar")
onready var Level = get_tree().get_root().get_node("Level1")

signal change_gold
signal change_experience

var speed
var normal_speed
var gold_for_kill
var experience_for_kill
var shield

func _ready():
	Hp_bar.max_value = Game.ENEMY2_HEALTH
	Hp_bar.value = Hp_bar.max_value
	speed = Game.ENEMY2_MOVEMENT_SPEED
	normal_speed = Game.ENEMY2_MOVEMENT_SPEED
	gold_for_kill = Game.ENEMY2_GOLD
	experience_for_kill = Game.ENEMY2_EXPERIENCE
	shield = Game.ENEMY2_SHIELD_RESISTANCE
	connect("change_gold", Level, "_change_gold")
	connect("change_experience", Level, "_change_experience")

func hit(bullet):
	if shield > 0:
		shield -= 1
		return
	else: 
		$ShieldSprite.visible = false
	Hp_bar.value -= bullet.damage
	if Hp_bar.value <= 0: 
		emit_signal("change_gold", gold_for_kill)
		emit_signal("change_experience", experience_for_kill)
		queue_free()

func slow(tower):
	speed *= tower.slow
	$Timer.start()

func _on_Timer_timeout():
	speed = normal_speed
