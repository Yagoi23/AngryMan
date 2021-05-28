extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	spawnenemy == false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

onready var enemy = preload("res://Enemy/Enemy.tscn")

#func _on_Area_body_entered(body):
#	var new_enemy = enemy.instance()
#		new_enemy.global_transform = $EnemySpawner/Position3D.global_transform
#		get_parent().add_child(new_enemy)
#	pass # Replace with function body.

var spawnenemy

func _process(delta):
	if spawnenemy == true:
		var new_enemy = enemy.instance()
		new_enemy.global_transform = $EnemySpawner/Position3D.global_transform
		get_parent().add_child(new_enemy) # Replace with function body.

func _on_Timer_timeout():
	spawnenemy = not spawnenemy


func _on_Area_body_shape_entered(body_id, body, body_shape, area_shape):
	$Timer.start()
	pass # Replace with function body.
