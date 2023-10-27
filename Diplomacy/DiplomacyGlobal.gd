extends Node
var fighting_bee = null
var remaining_bees = ["bee_1", "bee_2", "bee_3"]
var fighting_bees = []
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func start_fight(enemy_bee):
	fighting_bee = enemy_bee
	get_tree().change_scene_to_file("res://Diplomacy/fight_scene.tscn")
	#Returning for dialog box.
	return true

func add_fighting_bee(bee):
	fighting_bees.append(bee)
	remaining_bees.erase(bee)
