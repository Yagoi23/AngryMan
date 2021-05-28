extends KinematicBody

var speed = 100
var space_state
var target

onready var blood = preload("res://ParticleEffects/SnailBlood.tscn")

func _ready():
	space_state = get_world().direct_space_state

var health = 2

func hit_enemy():
	health -= 1
	var b = blood.instance()
	b.global_transform = global_transform
	get_parent().add_child(b)
	b.set_emitting(true)
	if health <= 0:
		queue_free()
		print("Killed " + filename)
#	else:
#		pass

func hit_player():
	PlayerInfo.change_health(-10)
	if PlayerInfo.health <= 0:
		get_tree().change_scene("res://Ui/DeathScreen/DeathScreen.tscn")

func _process(delta):
	if target:
		var result = space_state.intersect_ray(global_transform.origin, target.global_transform.origin)
		if result.collider.is_in_group("Player"):
			look_at(target.global_transform.origin, Vector3.UP)
			#set_color_red()
			move_to_target(delta)
			#$Snail/AnimationPlayer.play("ArmatureAction")
		#else:
			#set_color_green()
	if not is_on_floor():
		var velocity = Vector3()
		velocity.y -= 1
		velocity = move_and_slide(velocity, Vector3.UP)

func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		target = body
		print(body.name + " entered")
		#set_color_red()

func _on_Area_body_exited(body):
	if body.is_in_group("Player"):
		target = null
		print(body.name + " exited")
		#set_color_green()

func move_to_target(delta):
	var direction = (target.transform.origin - transform.origin).normalized()
	move_and_slide(direction * speed * delta, Vector3.UP)

#func set_color_red():
	#$MeshInstance.get_surface_material(0).set_albedo(Color(1, 0, 0))

#func set_color_green():
	#$MeshInstance.get_surface_material(0).set_albedo(Color(0, 1, 0))

var can_hit

func _on_HitZone_body_entered(body):
	if body.is_in_group("Player") and $HitTimer.is_stopped():
		$HitTimer.start(1)
		
		hit_player()
		can_hit = true
		print("HIT")
	#if body.is_in_group("Player"):
	#	hit_player()
#	pass # Replace with function body.




func _on_HitTimer_timeout():
	#$HitTimer.stop()
	#print("Yeet")
	if can_hit == true:
		#hit_player()
		print("Yeet")
		$HitTimer.start(1)


func _on_HitZone_body_exited(body):
	if body.is_in_group("Player"):
		can_hit = false
		print("NO HIT")
