extends Control

#Set up ball signals
signal ball_push
signal ball_jump
signal ball_left
signal ball_right

func _ready():
	pass # Replace with function body.

func _on_Ball_Push_button_down():
	emit_signal('ball_push') #Push ball forward signal

func _on_Ball_Jump_button_down():
	emit_signal('ball_jump') #Ball jump signal

func _on_Ball_Move_Left_button_down():
	emit_signal('ball_left') #Shift ball left signal


func _on_Ball_Move_Right_button_down():
	emit_signal('ball_right') #Shift ball right signal

func _on_Game_Restart_button_down():
	# Restart game
	get_tree().change_scene("res://Main.tscn")
	get_tree().paused = false #No game pause implemented yet, but just in case
