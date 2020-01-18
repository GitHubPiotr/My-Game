extends Path2D

const PathFollow = preload("res://levels/level1/PathFollow2D.tscn")
const Enemies = preload("res://enemies/Enemies.gd")

onready var Level = get_tree().get_root().get_node("Level1")

var current_round = 0
var current_spawn = 0

var round_started = false
var is_ready_to_spawn = false
var enemies_spawned = 0
var pathfollow = []
var timer = null

signal round_completed

func _ready():
	connect("round_completed", Level.get_node("Control/GameGUI"), "_enable_button")
	timer = Timer.new()
	timer.wait_time = Game.LEVEL1_SPAWN_DELAY
	timer.one_shot = true
	timer.autostart = true
	timer.connect("timeout", self, "_on_Timer_timeout")
	add_child(timer)

func _process(delta):
	for j in range(enemies_spawned):
		if pathfollow[j].get_children().size() >= 1:
			pathfollow[j].offset += pathfollow[j].get_child(0).speed * delta
	
	if not round_started: return
	if current_round >= Game.LEVEL1_AMOUNT_OF_ROUNDS: return
	if current_spawn >= Game.LEVEL1_SPAWN_INSTANCES[current_round]:
		current_round += 1
		current_spawn = 0
		round_started = false
		emit_signal("round_completed")
		return
	
	if is_ready_to_spawn:
		create_enemy_instance()
		current_spawn += 1
		timer.start()

func create_enemy_instance():
	pathfollow.push_back(PathFollow.instance())
	add_child(pathfollow.back())
	pathfollow.back().create_enemy(Enemies.get_enemy_index_of(Game.LEVEL1_SPAWN_QUEUE[enemies_spawned]))
	enemies_spawned += 1
	is_ready_to_spawn = false

func _on_Timer_timeout():
	is_ready_to_spawn = true

func _on_StartButton_pressed():
	round_started = true
