extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var isLeft = false
var dead = false


func _physics_process(delta):
	#death
	if GameManager.health == 0:
		dead = true
	
	
	#animation 
	if (velocity.x < -1 || velocity.x > 1):
		animated_sprite_2d.animation = "run"
	else:
		if not dead:
			animated_sprite_2d.animation = "default"
		else:
			animated_sprite_2d.animation = "dead"
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		animated_sprite_2d.animation = "jump"

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor() and not dead:
		velocity.y = JUMP_VELOCITY
		
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Left", "Right")
	if direction and not dead:
		if direction == -1:
			isLeft = true
		else:
			isLeft = false
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	animated_sprite_2d.flip_h = isLeft
	move_and_slide()
