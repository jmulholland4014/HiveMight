extends Tower 
class_name Enemy
@onready var hive_location = get_parent().get_parent().get_node("Hive").position
func clarifications():
	moving_animation = "Walking"

func get_new_target():
	target = hive_location

