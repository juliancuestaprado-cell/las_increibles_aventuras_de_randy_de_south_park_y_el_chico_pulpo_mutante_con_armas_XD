extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -700.0
@onready var animated =$AnimatedSprite2D
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		animated.play("jump2")
  
	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY   
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if velocity.x 	< 0:
			animated.flip_h= false
		else:
			animated.flip_h =true
			
		
		if is_on_floor():
			animated.play("run2")
	
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():
			animated.play("idle2")
	
	move_and_slide()
