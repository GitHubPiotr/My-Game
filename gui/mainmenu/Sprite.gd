extends Sprite


func _ready():
	Engine.time_scale = 0.02
	yield(get_tree(), "idle_frame")
