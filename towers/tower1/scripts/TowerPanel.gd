extends Node2D

onready var Level = get_tree().get_root().get_child(2)
onready var Button = get_node("Panel").get_node("VBoxContainer").get_node("HBoxContainer").get_node("Button")

onready var nme_label = get_node("Panel").get_node("VBoxContainer").get_node("TowerNameLabel")
onready var exp_label = get_node("Panel").get_node("VBoxContainer").get_node("TowerExpLabel")

onready var dmg_label = get_node("Panel").get_node("VBoxContainer").get_node("TowerDamageLabel")
onready var rds_label = get_node("Panel").get_node("VBoxContainer").get_node("TowerRangeLabel")
onready var rlt_label = get_node("Panel").get_node("VBoxContainer").get_node("TowerReloadTimeLabel")
onready var prc_label = get_node("Panel").get_node("VBoxContainer").get_node("TowerPierceLabel")

onready var req_exp_label = get_node("Panel").get_node("VBoxContainer").get_node("HBoxContainer").get_node("VBoxContainer").get_node("ExpRequiredLabel")
onready var req_gold_label = get_node("Panel").get_node("VBoxContainer").get_node("HBoxContainer").get_node("VBoxContainer").get_node("GoldRequiredLabel")

onready var tower_tier

var ready_to_close = false
var is_mouse_hovering = false

func _ready():
	Button.connect("pressed", self, "_on_Button_button_down")
	Button.connect("mouse_entered", self, "_on_Button_mouse_entered")
	Button.connect("mouse_exited", self, "_on_Button_mouse_exited")
	nme_label.set_text("Name: Tower1 +0")
	exp_label.set_text("EXP: 0.0")

# warning-ignore:unused_argument
func _process(delta):
	global_rotation = 0
	global_position = Vector2(get_parent().global_position.x - get_node("Panel").rect_size.x / 2, \
		get_parent().global_position.y - get_node("Panel").rect_size.y / 2)
	if ready_to_close: close_panel()
	#if Mouse.left_click: ready_to_close = true
	update_stats()
	get_parent().move_child(self, get_parent().get_child_count())

func update_stats():
	dmg_label.set_text("Damage: " + str(get_parent().bullet_damage))
	rds_label.set_text("Radius:  " + str(get_parent().radius))
	rlt_label.set_text("Reload time: " + str(get_parent().reload_time))
	prc_label.set_text("Pierce: " + str(get_parent().bullet_pierce))
	
	match tower_tier:
		null:
			nme_label.set_text("Name: Tower1 +0")
			req_exp_label.set_text("EXP: " + str(Game.TOWER1_UPGRADE_1[0]))
			req_gold_label.set_text("Gold: " + str(Game.TOWER1_UPGRADE_1[1]))
		"1":
			nme_label.set_text("Name: Tower1 +1")
			req_exp_label.set_text("EXP: " + str(Game.TOWER1_UPGRADE_2[0]))
			req_gold_label.set_text("Gold: " + str(Game.TOWER1_UPGRADE_2[1]))
		"2":
			nme_label.set_text("Name: Tower1 +2")
			req_exp_label.set_text("EXP: " + str(Game.TOWER1_UPGRADE_3[0]))
			req_gold_label.set_text("Gold: " + str(Game.TOWER1_UPGRADE_3[1]))
		"3":
			nme_label.set_text("Name: Tower1 +3")
			req_exp_label.set_text("EXP: " + str(Game.TOWER1_UPGRADE_4[0]))
			req_gold_label.set_text("Gold: " + str(Game.TOWER1_UPGRADE_4[1]))
		"4": 
			nme_label.set_text("Name: Tower1 +4")
			req_exp_label.set_text("EXP: " + "---")
			req_gold_label.set_text("Gold: " + "---")

func _on_Button_button_down():
	match tower_tier:
		null:
			if Level.gold <= Game.TOWER1_UPGRADE_1[0] or get_parent().experience <= Game.TOWER1_UPGRADE_1[1]: return
			
			Level.gold -= Game.TOWER1_UPGRADE_1[0]
			
			get_parent().damage_multiplier = Game.TOWER1_UPGRADE_1[2]
			get_parent().radius_multiplier = Game.TOWER1_UPGRADE_1[3]
			get_parent().reload_multiplier = Game.TOWER1_UPGRADE_1[4]
			get_parent().pierce_multiplier = Game.TOWER1_UPGRADE_1[5]
			
			tower_tier = "1"
			update_stats()
		"1":
			if Level.gold <= Game.TOWER1_UPGRADE_2[0] or get_parent().experience <= Game.TOWER1_UPGRADE_2[1]: return
			
			Level.gold -= Game.TOWER1_UPGRADE_2[0]
			
			get_parent().damage_multiplier = Game.TOWER1_UPGRADE_2[2]
			get_parent().radius_multiplier = Game.TOWER1_UPGRADE_2[3]
			get_parent().reload_multiplier = Game.TOWER1_UPGRADE_2[4]
			get_parent().pierce_multiplier = Game.TOWER1_UPGRADE_2[5]
			
			tower_tier = "2"
			update_stats()
		"2":
			if Level.gold <= Game.TOWER1_UPGRADE_3[0] or get_parent().experience <= Game.TOWER1_UPGRADE_3[1]: return
			
			Level.gold -= Game.TOWER1_UPGRADE_3[0]
			
			get_parent().damage_multiplier = Game.TOWER1_UPGRADE_3[2]
			get_parent().radius_multiplier = Game.TOWER1_UPGRADE_3[3]
			get_parent().reload_multiplier = Game.TOWER1_UPGRADE_3[4]
			get_parent().pierce_multiplier = Game.TOWER1_UPGRADE_3[5]
			
			tower_tier = "3"
			update_stats()
		"3":
			if Level.gold <= Game.TOWER1_UPGRADE_4[0] or get_parent().experience <= Game.TOWER1_UPGRADE_4[1]: return
			
			Level.gold -= Game.TOWER1_UPGRADE_4[0]
			
			get_parent().damage_multiplier = Game.TOWER1_UPGRADE_4[2]
			get_parent().radius_multiplier = Game.TOWER1_UPGRADE_4[3]
			get_parent().reload_multiplier = Game.TOWER1_UPGRADE_4[4]
			get_parent().pierce_multiplier = Game.TOWER1_UPGRADE_4[5]
			get_parent().auto_target = true
			
			tower_tier = "4"
			update_stats()
			
			
			
	if tower_tier == "4": Button.disabled = true

func close_panel():
	#if not is_mouse_hovering and Mouse.left_click:
		visible = false

func _on_Button_mouse_entered():
	is_mouse_hovering = true

func _on_Button_mouse_exited():
	is_mouse_hovering = false

func _on_Panel_mouse_entered():
	is_mouse_hovering = true

func _on_Panel_mouse_exited():
	is_mouse_hovering = false

func _on_DeleteTowerButton_pressed():
	get_parent().queue_free()
