extends RigidBody

func _ready():
	pass # Replace with function body.

##Ball Event Handlers
func ball_jump():
	print ("Ball Jump")
	mode = RigidBody.MODE_RIGID
	apply_impulse(Vector3(0, 0, 0), Vector3(0, 15, 0)) #Apply impulse to bottom to simulate a jump
	
func ball_left():
	print ("Ball Left")
	global_translate(Vector3(0, 0, -.4)) #Shift ball position left

func ball_right():
	print ("Ball Right")
	global_translate(Vector3(0, 0, .4)) #Shift ball position right

func ball_rot_left():
	print ("Ball Left")
	global_rotate(Vector3(0, 1, 0), .02) #Rotate ball position left

func ball_rot_right():
	print ("Ball Right")
	global_rotate(Vector3(0, 1, 0), -.02) #Rotate ball position left

func ball_push():
	print ("Ball Push")
	push_ball(Vector3(0, .1, 0))

func _on_Ball_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton and !event.pressed:
		print ("Ball Click Push")
		push_ball(click_normal)

func push_ball(location):
	get_node("Particles_Direction").hide()
	get_node("Particles_Direction").emitting = false
	mode = RigidBody.MODE_RIGID #Ball is initially set to STATIC in Main.gd so that it can be positioned before push
	apply_impulse(Vector3(0, -.1, 0), Vector3(-6, 5, 0)) #Simulating a pull-back with physics
	yield(get_tree().create_timer(0.4), "timeout") #Wait timer to give pull-back effect a moment
	apply_impulse(location, get_global_transform().basis.z * 80) #Impulse to push the ball forward at position you clicked
