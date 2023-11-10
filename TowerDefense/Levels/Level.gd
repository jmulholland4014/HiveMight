extends Node2D

@onready var enemies = get_node("Enemies")
@onready var enemy_spawn_pos = get_node("EnemySpawnPos")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_enemy(enemy):
	enemies.add_child(enemy)
	enemy.position = enemy_spawn_pos.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
