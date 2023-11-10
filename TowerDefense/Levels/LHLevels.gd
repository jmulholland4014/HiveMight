extends Node2D
var prev_index = 0
@onready var level_spawns = get_parent().get_node("LevelSpawns")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_level():
	if prev_index <= len(level_spawns.get_children()):
		var level = load(TDGlobalData.active_levels[len(TDGlobalData.active_levels)-1]).instantiate()
		add_child(level)
		level.position = level_spawns.get_children()[prev_index].position
		prev_index+=1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
