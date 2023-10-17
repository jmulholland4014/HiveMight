extends CharacterBody2D
class_name HiveMightCharacter
var health = 100
var dmg = 20
signal died 
@onready var animation_player = get_node("AnimationPlayer")
@onready var health_bar = get_node("HealthBar")
var invulnerable = false
func attack(char):
	char.take_damage(dmg)

func take_damage(dmg):
	invulnerable = true
	animation_player.play("Hurt")
	health -= dmg
	health_bar.value = health
	if health <= 0:
		#TODO: Maybe a death animation
		emit_signal("died")
		self.queue_free()

func _ready():
	health_bar.value = health
	
func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Hurt":
		invulnerable = false
