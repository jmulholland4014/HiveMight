extends Node
var hearts = 3
var levels = ["res://TowerDefense/Levels/level_1.tscn"]
var active_levels = []
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func add_level():
	if len(active_levels) < 3:
		var level = levels[randi() % len(levels)].instantiate()
		active_levels.append(level)
