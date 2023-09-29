extends CharacterBody2D
class_name HiveMightCharacter
var health = 100
var dmg = 20

func attack(char):
	char.take_damage(dmg)

func take_damage(dmg):
	health -= dmg
