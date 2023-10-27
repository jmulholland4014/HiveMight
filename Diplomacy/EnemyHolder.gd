extends Node2D

@onready var spawnPos = get_parent().get_node("SpawnPos")
@onready var new_bee_screen = get_parent().get_node("NewBeeAquired")
# Called when the node enters the scene tree for the first time.
func _ready():
	if DiplomacyGlobal.fighting_bee != null:
		var bee = load("res://Characters/Allys/" + DiplomacyGlobal.fighting_bee + ".tscn").instantiate()
		bee.position = spawnPos.position
		bee.connect("died", on_enemy_death)
		add_child(bee)
	else:
		print("ERROR: fight_scene not started after diplomacy, expect errors")
	pass # Replace with function body.

func on_enemy_death():
	new_bee_screen.visible = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
