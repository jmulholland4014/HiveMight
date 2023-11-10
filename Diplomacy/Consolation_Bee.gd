extends CanvasLayer

@onready var sprite = get_node("Sprite2D")
var random_bee_string
# Called when the node enters the scene tree for the first time.
func _ready():
	if len(DiplomacyGlobal.remaining_bees) > 0:
		random_bee_string = DiplomacyGlobal.remaining_bees[randi() % len(DiplomacyGlobal.remaining_bees)]
		var bee = load("res://Characters/Allys/" + random_bee_string + ".tscn").instantiate()
		var bee_sprite = bee.get_node("Sprite2D")
		sprite.texture = bee_sprite.texture
		sprite.modulate = bee_sprite.modulate

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_to_td_pressed():
	get_parent().change_to_TD(random_bee_string)
	pass # Replace with function body.
