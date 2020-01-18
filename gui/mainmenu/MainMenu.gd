extends Control

func _ready():
	$Camera2D/AudioStreamPlayer2D.play()
	$Menu.texture = $Viewport.get_texture()

func _on_Start_pressed():
	$Tween.interpolate_property($Camera2D, "position", Vector2(0, 0), Vector2(0, -720), 0.5, Tween.TRANS_BACK, Tween.EASE_IN_OUT)
	$Tween.start()

func _on_Exit_pressed():
	get_tree().quit()

func _on_BackButton_pressed():
	$Tween.interpolate_property($Camera2D, "position", Vector2(0, -720), Vector2(0, 0), 0.5, Tween.TRANS_BACK, Tween.EASE_IN_OUT)
	$Tween.start()

func _on_Options_pressed():
	$Tween.interpolate_property($Camera2D, "position", Vector2(0, 0), Vector2(1280, 0), 0.7, Tween.TRANS_BACK, Tween.EASE_IN_OUT)
	$Tween.start()

func _on_Button2_pressed():
	$Tween.interpolate_property($Camera2D, "position", Vector2(1280, 0), Vector2(0, 0), 0.7, Tween.TRANS_BACK, Tween.EASE_IN_OUT)
	$Tween.start()

var choosen_level = 0
var is_tweening_level_list = false

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		get_tree().change_scene("res://levels/Level1.tscn")

func _on_BRight_pressed():
	if is_tweening_level_list: return
	var level_list = $Levels/LevelList
	var screen_width = ProjectSettings.get("display/window/size/width")
	choosen_level += 1
	$Levels/TweenLL.interpolate_property(level_list, "position", level_list.position,
		level_list.position - Vector2(screen_width, 0), 0.3, Tween.TRANS_CUBIC, Tween.EASE_IN)
	$Levels/TweenLL.start()

func _on_BLeft_pressed():
	if is_tweening_level_list: return
	var level_list = $Levels/LevelList
	if choosen_level <= 0: return
	var screen_width = ProjectSettings.get("display/window/size/width")
	choosen_level -= 1
	$Levels/TweenLL.interpolate_property(level_list, "position", level_list.position,
		level_list.position + Vector2(screen_width, 0), 0.3, Tween.TRANS_CUBIC, Tween.EASE_IN)
	$Levels/TweenLL.start()

func _on_TweenLL_tween_started(object, key):
	is_tweening_level_list = true

func _on_TweenLL_tween_completed(object, key):
	is_tweening_level_list = false
