extends Node2D
var prev_index = 0
var level_spawns = get_parent().get_node("LevelSpawns")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_level():
	prev_index+=1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var level = TDGlobalData.active_levels[len(TDGlobalData.active_levels)]
	add_child(level)
	level.position = level_spawns.get_children()[len(TDGlobalData.active_levels)].position
	
	pass
