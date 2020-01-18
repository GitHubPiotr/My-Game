extends Area2D

func set_radius(radius):
	$CollisionShape2D.get_shape().set_radius(radius)
