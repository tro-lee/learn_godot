extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -250.0
const MAX_JUMPS = 2 # Maximum number of jumps allowed

var jumps_left = MAX_JUMPS # Track the number of jumps left

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		# Reset jumps when on the floor
		jumps_left = MAX_JUMPS

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and jumps_left > 0:
		velocity.y = JUMP_VELOCITY
		jumps_left -= 1 # Decrease the number of jumps left

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
