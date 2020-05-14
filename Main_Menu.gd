extends Node

func _ready():
	var default_audio_stream = get_node("AudioStreamPlayer")
	default_audio_stream.play()

func _on_Button_button_down():
	#Start game
	get_tree().change_scene("res://Main.tscn") #Load the demo level: Main.tscn
	get_tree().paused = false #No game pause implemented yet, but just in case
