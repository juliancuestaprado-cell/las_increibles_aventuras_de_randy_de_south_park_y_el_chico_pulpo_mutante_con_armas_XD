extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -800
@onready var animated =$AnimatedSprite2D
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		animated.play("jump")
  
	# Handle jump.
	if Input.is_key_pressed(KEY_W)  and is_on_floor():
		velocity.y = JUMP_VELOCITY 
		
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY   
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("KEY_D","KEY_A")
	if direction:
		velocity.x = direction * SPEED
		if velocity.x 	< 0:
			animated.flip_h= true
		else:
			animated.flip_h =false
			
		
		if is_on_floor():
			animated.play("run")
			
			
	if Input.is_key_pressed(KEY_D):
		velocity.x = 700
	if Input.is_key_pressed(KEY_A):
		velocity.x = -300
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():
			animated.play("idle")
	
	move_and_slide()
