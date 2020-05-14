extends RigidBody

func _ready():
	pass # Replace with function body.

func _process(delta):
	if MODE_RIGID:
		global_rotate(Vector3(0, 1, 0), .02)

func _on_Ball__Mercury_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton and !event.pressed:
		print("Mercury clicked.")
		mode = RigidBody.MODE_RIGID #Ball is initially set to STATIC in Main.gd so that it can be positioned before push
		apply_impulse(Vector3(0, -.1, 0), Vector3(-6, 5, 0)) #Simulating a pull-back with physics
		yield(get_tree().create_timer(0.4), "timeout") #Wait timer to give pull-back effect a moment
		apply_impulse(click_normal, Vector3(200, 40, 0)) #Impulse to push the ball forward at position you clicked
