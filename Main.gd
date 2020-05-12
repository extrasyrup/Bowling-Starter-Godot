extends Node

func _ready():
	var node_ball = get_node("Ball") #Reference to main ball
	var node_gui = get_node("GUI") #Reference to GUI (for signals)
	
	node_ball.mode = RigidBody.MODE_STATIC #Ball is initially set to STATIC so that it can be positioned before push
	
	#Connecting ball signals
	node_gui.connect("ball_push", node_ball, "ball_push")
	node_gui.connect("ball_jump", node_ball, "ball_jump")
	node_gui.connect("ball_left", node_ball, "ball_left")
	node_gui.connect("ball_right", node_ball, "ball_right")

func _on_Area_body_entered(body):
	#Trigger camera change when ball reaches this area
	print ("Camera Trigger Entered")
	var node_pins_cam = get_node("Pins_55/Camera") #Reference to camera in case more manipulation is needed
	node_pins_cam.set_current(true) #Set pin cam to current active (no longer follow the ball)

func _on_Ball_body_entered(body):
	print("Body Entered")
	#WIP: get signal when ball collides with the floor
