extends Area2D

const HitFx = preload("res://enemies/enemy1/HitFx.tscn")

onready var Hp_bar = get_node("ProgressBar")
onready var Level = get_tree().get_root().get_node("Level1")

signal change_gold
signal change_experience

var speed
var normal_speed
var gold_for_kill
var experience_for_kill

var label_root_pos

func _init():
	speed = Game.ENEMY1_MOVEMENT_SPEED
	normal_speed = Game.ENEMY1_MOVEMENT_SPEED
	gold_for_kill = Game.ENEMY1_GOLD
	experience_for_kill = Game.ENEMY1_EXPERIENCE

func _ready():
	label_root_pos = $TakenDamageInfo.rect_position
	Hp_bar.max_value = Game.ENEMY1_HEALTH
	Hp_bar.value = Hp_bar.max_value
	connect("change_gold", Level, "_change_gold")
	connect("change_experience", Level, "_change_experience")
	$AnimationPlayer.play("Anim")

func hit(bullet):
	hit_fx(bullet)
	Hp_bar.value -= bullet.damage
	if Hp_bar.value <= 0:
		emit_signal("change_gold", gold_for_kill)
		emit_signal("change_experience", experience_for_kill)
		var hit_fx = HitFx.instance()
		hit_fx.global_position = global_position
		get_parent().get_parent().add_child(hit_fx)
		queue_free()

func hit_fx(bullet):
	$TakenDamageInfo.visible = true
	$Tween.interpolate_property($Body, "modulate", Color(1,0.5,0.5,1), Color(1,1,1,1), 0.2, Tween.TRANS_CUBIC, Tween.EASE_IN)
	$TakenDamageInfo.text = str(bullet.damage)
	$Tween.interpolate_property($TakenDamageInfo, "modulate", Color(1,1,1,1), Color(1,1,1,0.5), 0.2, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.interpolate_property($TakenDamageInfo, "rect_position", label_root_pos, label_root_pos - Vector2(0, 15), 0.2, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()

func slow(bullet):
	speed -= bullet.slow
	if speed < 20: speed = 20
	$Timer.start()

func _on_Timer_timeout():
	speed = normal_speed

func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimationPlayer.play(anim_name)

func _on_Tween_tween_all_completed():
	$TakenDamageInfo.visible = false
