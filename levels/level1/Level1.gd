
extends Node

onready var GoldLabel = get_node("Control/GameGUI/Gold")
onready var RoundLabel = get_node("Control/GameGUI/Round")

var gold
var wave_round

func _ready():
	$MusicTheme.play()
	gold = Game.LEVEL1_START_GOLD
	GoldLabel.set_text(str(gold))
	wave_round = 0
	RoundLabel.set_text(str(wave_round) + " / " + str(Game.LEVEL1_AMOUNT_OF_ROUNDS))

func _change_gold(gold_):
	$Tweens/TweenG.interpolate_property(GoldLabel, "modulate", Color(1,1,1,1), Color(1,1,1,0), 0.5, Tween.TRANS_CUBIC, Tween.EASE_IN)
	$Tweens/TweenG.start()
	gold += gold_

func _on_TweenG_tween_all_completed():
	$Tweens/Tween.interpolate_property(GoldLabel, "modulate", Color(1,1,1,0), Color(1,1,1,1), 0.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	$Tweens/Tween.start()
	GoldLabel.set_text(str(gold))

func _change_wave_round():
	$Tweens/TweenR.interpolate_property(RoundLabel, "modulate", Color(1,1,1,1), Color(1,1,1,0), 0.5, Tween.TRANS_CUBIC, Tween.EASE_IN)
	$Tweens/TweenR.start()
	wave_round += 1

func _on_TweenR_tween_all_completed():
	$Tweens/Tween.interpolate_property(RoundLabel, "modulate", Color(1,1,1,0), Color(1,1,1,1), 0.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	$Tweens/Tween.start()
	RoundLabel.set_text(str(wave_round) + " / " + str(Game.LEVEL1_AMOUNT_OF_ROUNDS))

func _change_experience(experience):
	var divider = 0
	for object in $Towers.get_children(): if object.is_in_group("tower"): divider += 1
	for object in $Towers.get_children(): if object.is_in_group("tower"):
		object.experience += (experience / divider)

