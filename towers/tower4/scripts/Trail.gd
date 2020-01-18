extends Line2D

var point
var trail_length

func _init():
	trail_length = 10

func _process(delta):
	point = get_parent().get_parent().global_position
	add_point(point)
	while get_point_count() > trail_length:
		remove_point(0)

