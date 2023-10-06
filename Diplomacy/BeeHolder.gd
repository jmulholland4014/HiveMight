extends Node2D
var bees = [preload("res://Diplomacy/ButtonCharacters/bee_1.tscn"), preload("res://Diplomacy/ButtonCharacters/bee_2.tscn"), preload("res://Diplomacy/ButtonCharacters/bee_3.tscn")]
@onready var button_spawns = get_parent().get_node("Button_Spawns")
# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_bee_buttons()
	pass # Replace with function body.

func spawn_bee_buttons():
	for child in button_spawns.get_children():
		if bees.size() > 0:
			var index = randi() % bees.size()
			var bee = bees[index].instantiate()
			#Removes the bee to avoid duplicates
			bees.pop_at(index)
			add_child(bee)
			bee.position = child.position
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
