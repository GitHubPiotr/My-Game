extends Node2D

onready var NameLabel = $Panel/VBoxContainer/NameLabel
onready var ExpLabel = $Panel/VBoxContainer/ExpLabel

onready var DamageLabel = $Panel/VBoxContainer/DamageLabel
onready var RadiusLabel = $Panel/VBoxContainer/RadiusLabel
onready var ReloadTimeLabel = $Panel/VBoxContainer/ReloadTimeLabel
onready var PierceLabel = $Panel/VBoxContainer/PierceLabel
onready var SlowLabel = $Panel/VBoxContainer/SlowLabel

onready var ReqExpLabel = $Panel/VBoxContainer2/ExpRequiredLabel
onready var ReqGoldLabel = $Panel/VBoxContainer2/GoldRequiredLabel

var tower = null

func update_stats():
	NameLabel.set_text("Name: " + tower.type + " + " + tower.tier )
	ExpLabel.set_text("Exp: " + str(tower.experience))
	DamageLabel.set_text("Damage: " + str(tower.bullet_damage))
	RadiusLabel.set_text("Radius: " + str(tower.radius))
	ReloadTimeLabel.set_text("Reload time: " + str(tower.reload_time))
	PierceLabel.set_text("Pierce: " + str(tower.bullet_pierce))
	SlowLabel.set_text("Slow: " + str(tower.slow))
	if tower.tier == "4":
		ReqExpLabel.set_text("Exp: ---")
		ReqGoldLabel.set_text("Gold: ---")
		return
	ReqExpLabel.set_text("Exp: " + str(tower.upgrade[int(tower.tier)][0]))
	ReqGoldLabel.set_text("Gold: " + str(tower.upgrade[int(tower.tier)][1]))

func _on_Button_pressed():
	match tower.tier:
		"0":
			tower._upgrade_tower(tower.upgrade[0])
			tower.tier = "1"
		"1":
			tower._upgrade_tower(tower.upgrade[1])
			tower.tier = "2"
		"2":
			tower._upgrade_tower(tower.upgrade[2])
			tower.tier = "3"
		"3":
			tower._upgrade_tower(tower.upgrade[3])
			tower.tier = "4"

	update_stats()

var default_pos = Vector2(ProjectSettings.get_setting("display/window/size/width"), 0)
var anim_completed = true

func _open_tower_panel(tower_):
	if anim_completed == false: return
	tower = tower_
	update_stats()
	visible = true
	anim_completed = false
	$TweenO.interpolate_property(self, "position", default_pos, Vector2(default_pos.x - $Panel.rect_size.x, position.y), 0.3, Tween.TRANS_QUAD, Tween.EASE_IN)
	$TweenO.start()

func _close_tower_panel():
	$TweenC.interpolate_property(self, "position", default_pos - Vector2($Panel.rect_size.x, 0) , Vector2(default_pos.x + $Panel.rect_size.x, position.y), 0.3, Tween.TRANS_QUAD, Tween.EASE_OUT)
	$TweenC.start()

func _on_TweenO_tween_completed(object, key):
	anim_completed = true

func _on_TweenC_tween_completed(object, key):
	visible = false
