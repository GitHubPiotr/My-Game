extends Area2D

var gold_for_kill = Game.ENEMY3_GOLD
var experience_for_kill = Game.ENEMY3_EXPERIENCE
onready var hp_bar = get_node("ProgressBar")
onready var level = get_parent().get_parent().get_parent().get_parent()

func _ready():
	hp_bar.max_value = Game.ENEMY3_HEALTH
	hp_bar.value = hp_bar.max_value

func hit(damage):
	hp_bar.value -= damage
	if hp_bar.value <= 0: 
		level.gold += gold_for_kill
		level.experience += experience_for_kill
		queue_free()
