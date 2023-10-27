extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame. res://Diplomacy/Characters/bee_1.dialogue
func _process(delta):
	pass


func _on_pressed():
	DialogueManager.show_example_dialogue_balloon(load("res://Diplomacy/ButtonCharacters/" + name + ".dialogue"), "start")
	return
