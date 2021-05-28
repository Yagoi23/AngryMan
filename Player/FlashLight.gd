extends SpotLight


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	pass # Replace with function body.

func _input(event):
	if not PlayerInfo.power <= 0:
		if Input.is_action_just_pressed("flashlight") and visible == true:
			visible = false
#			print("flashlight off")
		elif Input.is_action_just_pressed("flashlight") and visible == false:
			visible = true
	elif PlayerInfo.power <= 0:
		visible = false
#			print("flashlight on")
	


func _on_PowerDrain_timeout():
	if visible == true:
		PlayerInfo.change_power(-1)
#	pass # Replace with function body.
