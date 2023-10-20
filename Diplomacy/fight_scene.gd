extends Node2D

@onready var consolation_bee = get_node("Consolation_Bee")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since` the previous frame.
func _process(delta):
	pass


func _on_player_died():
	consolation_bee.visible = true
	pass # Replace with function body.
