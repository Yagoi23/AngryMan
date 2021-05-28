extends StaticBody

onready var StoneChips = preload("res://ParticleEffects/StoneChips.tscn")
var health = 2

func hit_enemy():
	health -= 1
	var s = StoneChips.instance()
	s.global_transform = global_transform
	get_parent().add_child(s)
	s.set_emitting(true)
	if health <= 0:
		queue_free()
		print("Killed " + filename)
