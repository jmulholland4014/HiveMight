extends Node2D
var enemies = [preload("res://Towers/raccoon.tscn")]
@export var num_enemies_remaining = 5
@onready var timer = get_parent().get_node("SpawnTimer")
@onready var enemy_holder = get_parent().get_node("Enemies")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_timer_timeout():
	num_enemies_remaining -= 1
	if num_enemies_remaining == 1:
		timer.one_shot = true
	var enemy = enemies[randi() % enemies.size()].instantiate()
	var spawn_point = get_children()[randi() % get_children().size()].position
	enemy.position = spawn_point
	enemy_holder.add_child(enemy)
	
	
	pass # Replace with function body.
