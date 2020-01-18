extends Node

const Enemy1 = preload("res://enemies/enemy1/Enemy1.tscn")
const Enemy2 = preload("res://enemies/enemy2/Enemy2.tscn")
const Enemy3 = preload("res://enemies/enemy3/Enemy3.tscn")
const Enemy4 = preload("res://enemies/enemy4/Enemy4.tscn")

static func get_enemy_index_of(enemy_index):
	var enemy = null
	match enemy_index:
		1: enemy = Enemy1.instance()
		2: enemy = Enemy2.instance()
		3: enemy = Enemy3.instance()
		4: enemy = Enemy4.instance()
		_: enemy = Enemy1.instance()
	return enemy
