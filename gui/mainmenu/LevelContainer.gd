extends VBoxContainer

func _on_Level1_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://levels/Level1.tscn")
