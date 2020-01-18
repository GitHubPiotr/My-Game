extends Area2D

onready var hp_bar = get_node("ProgressBar")
onready var level = get_parent().get_parent().get_parent().get_parent()

var gold_for_kill
var speed
var experience_for_kill
var shield

func _ready():
	hp_bar.max_value = Game.ENEMY4_HEALTH
	hp_bar.value = hp_bar.max_value
	gold_for_kill = Game.ENEMY4_GOLD
	speed = Game.ENEMY4_MOVEMENT_SPEED
	experience_for_kill = Game.ENEMY4_EXPERIENCE
	shield = Game.ENEMY4_SHIELD_RESISTANCE

func hit(damage):
	if shield > 0:
		shield -= 1
		return
	else: 
		$ShieldSprite.visible = false
	
	hp_bar.value -= damage
	
	if is_dead(): 
		level.gold += gold_for_kill
		level.experience += experience_for_kill
		queue_free()

func is_dead() -> bool:
	if hp_bar.value <= 0: return true
	else: return false