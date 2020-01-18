extends Area2D

var player_health

func _ready():
	player_health = Game.LEVEL1_PLAYER_HEALTH

func enemy_entered():
	player_health -= 1
	if player_health <= 0:
		pass #GAME OVER

func _on_GameOver_area_entered(area):
	enemy_entered()
	area.queue_free()
