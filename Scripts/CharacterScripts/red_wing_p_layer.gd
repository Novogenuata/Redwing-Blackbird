extends CharacterBody2D
class_name player_script
@onready var Sprite = $AnimatedSprite2D 

@export var SPEED = 300.0
@export var JUMP_VELOCITY = -500.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if velocity.x > 0:
			Sprite.flip_h = true
			
		elif velocity.x < 0:
			Sprite.flip_h = false
		Sprite.play("Walk")

	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if Sprite.animation not in ["Idle", "Idle_look_around"]:
			Sprite.play("Idle")

	move_and_slide()


func _on_timer_timeout() -> void:
	if Sprite.animation == "Idle" and velocity == Vector2.ZERO:
		Sprite.play("Idle_look_around")
	$Timer.wait_time = randf_range(5.0, 10.0)
	$Timer.start()

		
	


func _on_red_wing_sprite_animation_finished() -> void:
	if Sprite.animation == "Idle_look_around" and velocity == Vector2.ZERO:
		Sprite.play("Idle")
		$Timer.wait_time = randf_range(5.0, 10.0) 
		$Timer.start()
