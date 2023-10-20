extends CanvasLayer

@onready var sprite = get_node("Sprite2D")
# Called when the node enters the scene tree for the first time.
func _ready():
	if DiplomacyGlobal.fighting_bee != null:
		var bee = load("res://Characters/Allys/" + DiplomacyGlobal.fighting_bee + ".tscn").instantiate()
		var bee_sprite = bee.get_node("Sprite2D")
		sprite.texture = bee_sprite.texture
		sprite.modulate = bee_sprite.modulate
	else:
		print("ERROR: fight_scene not started after diplomacy, expect errors")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_to_td_pressed():
	DiplomacyGlobal.add_fighting_bee(DiplomacyGlobal.fighting_bee)
	pass # Replace with function body.
