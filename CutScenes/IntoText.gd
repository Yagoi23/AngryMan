extends Control
var text
var textline

func _ready():
	textline = 0
	text = " "
	$RichTextLabel.text = text

func _process(delta):
	if textline == 1:
		text = "Wh... Where am I?"
	elif textline == 2:
		text = "No. It couldn't be..."
	elif textline == 3:
		text = "They must have betrayed me..."
	elif textline == 4:
		text = "Now I'm ANGRY!"
	elif textline == 6:
		get_tree().change_scene("res://Levels/Level1.tscn")
	else:
		text = " "
	$RichTextLabel.text = text


func _on_Timer_timeout():
	textline += 1
	$Timer.start(2.5)
