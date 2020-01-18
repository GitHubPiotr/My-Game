extends Node2D

var button_pos = []

func _ready():
	for i in Game.AMOUNT_OF_TOWERS:
		button_pos.append(Vector2(-Game.TOWER_SELECTOR_DEFAULT_POS_X + i*Game.TOWER_SELECTOR_DEFAULT_GAP, -Game.TOWER_SELECTOR_DEFAULT_POS_Y))

func anim_buttons():
	for button in get_children(): if button.is_in_group("button"):
		button.modulate.a = 0.0
	
	var margin = set_margin()
	var duration = 0.2
	var alpha_color = [Color(1,1,1,0.0), Color(1,1,1,1)]
	
	# Button 1
	$TweenO.interpolate_property($Button1, "position", Vector2.ZERO , button_pos[0] + margin, duration, Tween.TRANS_QUINT, Tween.EASE_OUT)
	$TweenO.interpolate_property($Button1, "modulate", alpha_color[0], alpha_color[1], duration, Tween.TRANS_LINEAR, Tween.EASE_IN)
	# Button 2
	$TweenO.interpolate_property($Button2, "position", Vector2.ZERO, button_pos[1] + margin, duration, Tween.TRANS_QUINT, Tween.EASE_OUT, 0.05)
	$TweenO.interpolate_property($Button2, "modulate", alpha_color[0], alpha_color[1], duration, Tween.TRANS_LINEAR, Tween.EASE_IN, 0.05)
	# Button 3
	$TweenO.interpolate_property($Button3, "position", Vector2.ZERO, button_pos[2] + margin, duration, Tween.TRANS_QUINT, Tween.EASE_OUT, 0.1)
	$TweenO.interpolate_property($Button3, "modulate", alpha_color[0], alpha_color[1], duration, Tween.TRANS_LINEAR, Tween.EASE_IN, 0.1)
	# Button 4
	$TweenO.interpolate_property($Button4, "position", Vector2.ZERO, button_pos[3] + margin, duration, Tween.TRANS_QUINT, Tween.EASE_OUT, 0.15)
	$TweenO.interpolate_property($Button4, "modulate", alpha_color[0], alpha_color[1], duration, Tween.TRANS_LINEAR, Tween.EASE_IN, 0.15)
	# Button 5
	$TweenO.interpolate_property($Button5, "position", Vector2.ZERO, button_pos[4] + margin, duration, Tween.TRANS_QUINT, Tween.EASE_OUT, 0.2)
	$TweenO.interpolate_property($Button5, "modulate", alpha_color[0], alpha_color[1], duration, Tween.TRANS_LINEAR, Tween.EASE_IN, 0.2)
	
	$TweenO.start()

func set_margin() -> Vector2:
	var vector = Vector2.ZERO
	var mouse_pos = get_viewport().get_mouse_position()
	if mouse_pos.y < Game.TOWER_SELECTOR_DEFAULT_POS_Y: vector += Vector2(0, Game.TOWER_SELECTOR_DEFAULT_POS_Y * 2)
	if mouse_pos.x < Game.TOWER_SELECTOR_DEFAULT_POS_X * 1.2: vector += Vector2(Game.TOWER_SELECTOR_DEFAULT_POS_X, 0)
	elif mouse_pos.x > ProjectSettings.get("display/window/size/width") - Game.TOWER_SELECTOR_DEFAULT_POS_X * 1.2: vector -= Vector2(Game.TOWER_SELECTOR_DEFAULT_POS_X, 0)
	return vector

func _place_selected():
	global_position = get_viewport().get_mouse_position()
	for button_texture in get_children(): if button_texture.is_in_group("texture"):
		button_texture.global_position = global_position
	anim_buttons()
	visible = true

func _close_tower_select_menu():
	$TweenC.interpolate_property($Button1, "modulate", Color(1,1,1,1), Color(1,1,1,0), 0.3, Tween.TRANS_CIRC, Tween.EASE_IN)
	$TweenC.interpolate_property($Button2, "modulate", Color(1,1,1,1), Color(1,1,1,0), 0.3, Tween.TRANS_CIRC, Tween.EASE_IN)
	$TweenC.interpolate_property($Button3, "modulate", Color(1,1,1,1), Color(1,1,1,0), 0.3, Tween.TRANS_CIRC, Tween.EASE_IN)
	$TweenC.interpolate_property($Button4, "modulate", Color(1,1,1,1), Color(1,1,1,0), 0.3, Tween.TRANS_CIRC, Tween.EASE_IN)
	$TweenC.interpolate_property($Button5, "modulate", Color(1,1,1,1), Color(1,1,1,0), 0.3, Tween.TRANS_CIRC, Tween.EASE_IN)
	$TweenC.start()

func _on_TweenC_tween_all_completed():
	visible = false
