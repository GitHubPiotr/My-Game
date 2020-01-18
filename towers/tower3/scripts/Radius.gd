extends Area2D

onready var collision_range = get_node("CollisionShape2D").shape

func set_radius(radius):
	collision_range.set_radius(radius)
