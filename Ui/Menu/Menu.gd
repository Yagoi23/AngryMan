extends Control
#var paused
var pause
#func _ready():
	#paused = false
	#visible = not visible
	#visible = false
	#$Menu.visible = false
	#get_node("Menu").set_visible()
	#pass # Replace with function body.

func _ready():
	pause = false
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	#PlayerInfo.reset_level()

func _input(event):
	if event.is_action_pressed("esc"):
		get_tree().paused = not get_tree().paused
		visible = not visible
		if pause == true:
			pause = false
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		elif pause != true:
			pause = true
			Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
		
	pass

#func _input(event):
#	if event.is_action_pressed("menu") and paused == false:
#		get_tree().set_pause(true)
#		paused = true
#		visible = true
#		print("paused")
#	elif event.is_action_pressed("menu") and paused == true:
#		get_tree().set_pause(false)
#		paused = false
#		visible = false
#		print("unpaused")
	#pass

#func _process(delta):
#	if Input.is_action_pressed("menu") and paused == false:
#		get_tree().set_pause(true)
#		paused = true
#		visible = true
#		print("paused")
#	elif Input.is_action_pressed("menu") and paused == true:
#		get_tree().set_pause(false)
#		paused = false
#		visible = false
#		print("unpaused")
#	pass
	
		#get_node("Menu").set_visible()
		#$Menu.visible = true

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Resume_pressed():
	get_tree().paused = not get_tree().paused
	visible = not visible
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pause = false
	#get_tree().paused = not get_tree().paused
#	get_tree().paused = false
	#visible = false
	#print("unpaused")
	pass # Replace with function body.


func _on_Exit_pressed():
	#PlayerInfo.reset_level()
	get_tree().change_scene("res://Ui/TitleScreen/Title.tscn")
	
	#pass # Replace with function body.


#func _on_Inventory_pressed():
#
#	pass # Replace with function body.


func _on_Options_pressed():
	pass # Replace with function body.
