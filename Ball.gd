extends RigidBody

func _ready():
	pass # Replace with function body.

##Ball Event Handlers
func ball_push():
	print ("Ball Push")
	mode = RigidBody.MODE_RIGID #Ball is initially set to STATIC in Main.gd so that it can be positioned before push
	apply_impulse(Vector3(0, -.1, 0), Vector3(-6, 5, 0)) #Simulating a pull-back with physics
	yield(get_tree().create_timer(0.4), "timeout") #Wait timer to give pull-back effect a moment
	apply_impulse(Vector3(0, .1, 0), Vector3(40, 0, 0)) #Impulse to push the ball forward

func ball_jump():
	print ("Ball Jump")
	mode = RigidBody.MODE_RIGID
	apply_impulse(Vector3(0, 0, 0), Vector3(0, 10, 0)) #Apply impulse to bottom to simulate a jump
	
func ball_left():
	print ("Ball Left")
	global_translate(Vector3(0, 0, -.5)) #Shift ball position left

	
func ball_right():
	print ("Ball Right")
	global_translate(Vector3(0, 0, .5)) #Shift ball position right

func _on_Ball_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		print ("Ball Click Position")
		mode = RigidBody.MODE_RIGID
		apply_impulse(Vector3(0, -.1, 0), Vector3(-6, 5, 0)) #Simulating a pull-back with physics
		yield(get_tree().create_timer(0.4), "timeout") #Wait timer to give pull-back effect a moment
		apply_impulse(click_normal, Vector3(20, 0, 0)) #Impulse to push the ball forward at position you clicked
