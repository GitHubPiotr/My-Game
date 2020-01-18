extends Node

# BASE GAME VALUES
const AMOUNT_OF_TOWERS = 5
const TOWER_SELECTOR_DEFAULT_POS_X = 145
const TOWER_SELECTOR_DEFAULT_POS_Y = 80
const TOWER_SELECTOR_DEFAULT_GAP = 72

# LEVEL1
const LEVEL1_PLAYER_HEALTH = 10
const LEVEL1_START_GOLD = 2000
const LEVEL1_SPAWN_DELAY = 2
const LEVEL1_AMOUNT_OF_ROUNDS = 5
const LEVEL1_SPAWN_INSTANCES = [4,3,4,5,6]
const LEVEL1_SPAWN_QUEUE = [1,1,1,1,
							1,2,2,
							3,3,2,2,
							4,4,4,2,2,
							1,1,1,1,1,1]

########################################################################################

# ENEMY1
const ENEMY1_HEALTH = 1000.0
const ENEMY1_MOVEMENT_SPEED = 40.0
const ENEMY1_GOLD = 15.0
const ENEMY1_EXPERIENCE = 3500

# ENEMY2
const ENEMY2_HEALTH = 100.0
const ENEMY2_MOVEMENT_SPEED = 100.0
const ENEMY2_GOLD = 15.0
const ENEMY2_EXPERIENCE = 35.0
const ENEMY2_SHIELD_RESISTANCE = 50

# ENEMY3
const ENEMY3_HEALTH = 200.0
const ENEMY3_MOVEMENT_SPEED = 125.0
const ENEMY3_GOLD = 25.0
const ENEMY3_EXPERIENCE = 65.0

# ENEMY4
const ENEMY4_HEALTH = 200.0
const ENEMY4_MOVEMENT_SPEED = 125.0
const ENEMY4_GOLD = 25.0
const ENEMY4_EXPERIENCE = 65.0
const ENEMY4_SHIELD_RESISTANCE = 65

########################################################################################

# TOWER1 STATS
const TOWER1_COST = 200
const TOWER1_DAMAGE = 12
const TOWER1_RADIUS = 300
const TOWER1_RELOAD_TIME = 0.3
const TOWER1_BULLET_VELOCITY = 800
const TOWER1_PIERCE = 1
const TOWER1_SLOW = 0

# TOWER1 UPGRADES [EXP, COST, DMG, RADIUS, RELOAD, PIERCE, SLOW]
const TOWER1_UPGRADE = [[150, 100, 1.10, 1.10, 0.95, 2, 0],
								[200, 200, 1.25, 1.25, 0.90, 3, 0],
								[300, 300, 1.45, 1.45, 0.80, 3, 0],
								[450, 500, 1.70, 1.70, 0.70, 4, 0]]

# TOWER2 STATS
const TOWER2_COST = 300
const TOWER2_DAMAGE = 50
const TOWER2_RADIUS = 300
const TOWER2_RELOAD_TIME = 2.5
const TOWER2_BULLET_VELOCITY = 400
const TOWER2_PIERCE = 1
const TOWER2_SLOW = 0

# TOWER2 UPGRADES [EXP, COST, DMG, RADIUS, RELOAD, PIERCE, SLOW]
const TOWER2_UPGRADE = [[250, 200, 1.10, 1.10, 0.95, 1, 0],
								[300, 300, 1.25, 1.25, 0.90, 1, 0],
								[400, 400, 1.45, 1.45, 0.80, 1, 0],
								[550, 600, 1.70, 1.70, 0.70, 1, 0]]

# TOWER3 STATS
const TOWER3_COST = 250
const TOWER3_DAMAGE = 3
const TOWER3_RADIUS = 300
const TOWER3_RELOAD_TIME = 0.02
const TOWER3_BULLET_VELOCITY = 1500
const TOWER3_PIERCE = 1
const TOWER3_SLOW = 0

# TOWER3 UPGRADES [EXP, COST, DMG, RADIUS, RELOAD, PIERCE, SLOW]
const TOWER3_UPGRADE = [[250, 200, 1.10, 1.10, 0.90, 1, 0],
								[300, 300, 1.25, 1.25, 0.80, 1, 0],
								[400, 400, 1.45, 1.45, 0.70, 1, 0],
								[550, 600, 1.70, 1.60, 0.60, 1, 0]]

# TOWER4 STATS
const TOWER4_COST = 225
const TOWER4_DAMAGE = 70
const TOWER4_RADIUS = 1500
const TOWER4_RELOAD_TIME = 2
const TOWER4_BULLET_VELOCITY = 3000
const TOWER4_PIERCE = 1
const TOWER4_SLOW = 0

# TOWER4 UPGRADES [EXP, COST, DMG, RADIUS, RELOAD, PIERCE, SLOW]
const TOWER4_UPGRADE = [[150, 100, 1.10, 1, 0.95, 0, 0],
								[200, 200, 1.25, 1, 0.90, 0, 0],
								[300, 300, 1.45, 1, 0.80, 0, 0],
								[450, 500, 1.70, 1, 0.70, 0, 0]]

# TOWER5 STATS
const TOWER5_COST = 175
const TOWER5_DAMAGE = 0
const TOWER5_RADIUS = 200
const TOWER5_RELOAD_TIME = 1.25
const TOWER5_BULLET_VELOCITY = 0
const TOWER5_PIERCE = 1
const TOWER5_SLOW = 5

# TOWER5 UPGRADES [EXP, COST, DMG, RADIUS, RELOAD, PIERCE, SLOW]
const TOWER5_UPGRADE = [[150, 100, 0, 1.10, 0.95, 0, 0],
								[200, 200, 0, 1.25, 0.90, 0, 0],
								[300, 300, 0, 1.45, 0.80, 0, 0],
								[450, 500, 0, 1.70, 0.70, 0, 0]]
