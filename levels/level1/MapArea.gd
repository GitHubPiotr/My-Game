extends Area2D

onready var tower_select_menu = get_parent().get_node("Control/TowerSelectMenu")
onready var tower_panel = get_parent().get_node("Control/TowerPanel")
onready var cursor = get_parent().get_node("Control/Cursor")

signal place_selected
signal cannot_place_tower
signal can_place_tower
signal close_tower_panel
signal close_tower_select_menu

func _ready():
	connect("place_selected", tower_select_menu, "_place_selected")
	connect("cannot_place_tower", cursor, "_cannot_place_tower")
	connect("can_place_tower", cursor, "_can_place_tower")
	connect("close_tower_panel", tower_panel, "_close_tower_panel")
	connect("close_tower_select_menu", tower_select_menu, "_close_tower_select_menu")

func _process(delta):
	if not tower_select_menu.visible:
		cursor.global_position = get_viewport().get_mouse_position()
		if is_possible_to_place_tower(): emit_signal("can_place_tower")
		else: emit_signal("cannot_place_tower")

func is_possible_to_place_tower() -> bool:
	for area in cursor.get_overlapping_areas():
		if area.is_in_group("path") or area.is_in_group("tower") or area.is_in_group("environment"): return false
	return true

func _tower_selected():
	tower_select_menu.visible = false

func _on_Map_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if tower_panel.visible and tower_panel.anim_completed:
			emit_signal("close_tower_panel")
		elif tower_select_menu.visible:
			emit_signal("close_tower_select_menu")
		elif is_possible_to_place_tower() and not tower_select_menu.visible:
			cursor.global_position = get_viewport().get_mouse_position()
			emit_signal("place_selected")
