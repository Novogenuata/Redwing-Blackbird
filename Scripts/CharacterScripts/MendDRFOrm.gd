extends player_script

@export var bullet: PackedScene

var firing = false
var firing_finished = false

func _physics_process(delta: float) -> void:
	if firing_finished and not Input.is_action_pressed("Fire"):
		firing = false
		firing_finished = false
		Sprite.play("Idle")
		return


	if firing:
		velocity.x = 0
		move_and_slide()
		return
	super(delta)

	if Input.is_action_just_pressed("Fire"):
		firing = true
		firing_finished = false
		Sprite.play("Fire")


func _on_animated_sprite_2d_animation_finished() -> void:
	if Sprite.animation == "Fire":
		firing_finished = true
		if Input.is_action_pressed("Fire"):
			Sprite.stop()
			Sprite.frame = Sprite.sprite_frames.get_frame_count("Fire") - 1
