extends Node

func _ready():
	pass # Replace with function body.

func _on_Button_button_down():
	#Start game
	get_tree().change_scene("res://Main.tscn") #Load the demo level: Main.tscn
	get_tree().paused = false #No game pause implemented yet, but just in case
