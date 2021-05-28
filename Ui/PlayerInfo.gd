extends Node

var health
var max_health
var ammo
var max_ammo
var ammo_clip
var clip_size
var difficulty
var power
var max_power
var current_level
var weapon
var textevent

#var weapon = null

var mouse_sensitivity


func _ready():
	health = 100
	max_health = 100
	ammo = 100
	power = 100
	max_power = 100
	max_ammo = 100
	ammo_clip = 100
	clip_size = 100
	difficulty = 0
	mouse_sensitivity = 0.003
	weapon = false
	textevent = " "

func change_difficulty(ammount):
	difficulty = ammount

func change_health(ammount):
	health += ammount - (difficulty * 10)
	health = clamp(health, 0, max_health)

func change_ammo(ammount):
	ammo += ammount
	ammo = clamp(ammo, 0, max_ammo)

func change_power(ammount):
	power += ammount - (difficulty * 10)
	power = clamp(power, 0, max_power)

func change_max_ammo(ammount):
	max_ammo = ammount

func change_max_power(ammount):
	max_power = ammount

func get_health():
	return health

func get_power():
	return power

func get_ammo():
	return ammo

func has_ammo():
	return ammo > 0

func change_ammo_clip(ammount):
	ammo_clip += ammount

func has_ammo_clip():
	return ammo_clip > 0

func get_clip_size():
	return clip_size

#func change_weapon():
#	pass
#
#func get_weapon():
#	return weapon
func change_level():
	print("1234567")
	current_level += 1
	get_tree().change_scene("res://Levels/Level"+str(current_level)+".tscn")

func reset_level():
	current_level = 1


func change_mouse_sensitivity(ammount):
	mouse_sensitivity = ammount

func get_mouse_sensitivity():
	return mouse_sensitivity

#func set_textevent_get_gun():
#	textevent = "I'll show them."

func get_textevent():
	return textevent
