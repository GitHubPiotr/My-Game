extends Node2D

onready var Level1 = get_tree().get_root().get_node("Level1")
onready var Path2D = Level1.get_node("Map/Areas/Path2D")

signal change_wave_round

func _ready():
	connect("change_wave_round", Level1, "_change_wave_round")

func _enable_button():
	$Start.disabled = false

func _on_Start_pressed():
	emit_signal("change_wave_round")
	Path2D.round_started = true
	if Path2D.current_round >= Game.LEVEL1_AMOUNT_OF_ROUNDS: $Start.disabled = true
	$Start.disabled = true

func _on_Button_pressed():
	get_tree().change_scene("res://gui/mainmenu/MainMenu.tscn")
