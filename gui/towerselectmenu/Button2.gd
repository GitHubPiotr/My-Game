extends "res://gui/towerselectmenu/TSMButtonScript.gd"

func _ready():
	Tower = preload("res://towers/Tower2.tscn")
	TowerModel = get_parent().get_node("TowerModel2")
	$Tween.interpolate_property(TowerModel, "modulate", Color(1,1,1,0.2), Color(1,1,1,0.4), 1, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.interpolate_property(TowerModel, "modulate", Color(1,1,1,0.4), Color(1,1,1,0.2), 1, Tween.TRANS_LINEAR, Tween.EASE_OUT, 1)
	$Tween.start()
