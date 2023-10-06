extends Node
var fighting_bee
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
