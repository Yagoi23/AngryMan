extends KinematicBody

func _process(delta):
	move_and_slide(Vector3(0, 0, -0.5))
	$Snail/AnimationPlayer.play("ArmatureAction")
	
