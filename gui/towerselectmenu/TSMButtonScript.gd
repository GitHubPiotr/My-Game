extends Node

onready var Level = get_tree().get_root().get_node("Level1")
onready var TowerModel = null
var Tower = null

signal tower_selected

func _ready():
	var LevelMap = Level.get_node("Map")
	connect("tower_selected", LevelMap, "_tower_selected")

func _process(delta):
	if $Button.is_hovered():
		TowerModel.visible = true
	else:
		TowerModel.visible = false

func _on_Button_pressed():
	var tower = Tower.instance()
	tower.global_position = get_parent().global_position
	var TowerContainer = Level.get_node("Towers")
	TowerContainer.add_child(tower)
	emit_signal("tower_selected")
