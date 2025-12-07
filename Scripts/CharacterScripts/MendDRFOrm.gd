
extends player_script
var firing = false

func _physics_process(delta: float) -> void:
	
	if firing:
		velocity.x = 0
		move_and_slide()
		return
		
	super(delta)
	if Input.is_action_pressed("Fire"):
		firing = true
		Sprite.play("Fire")
		
		
	


func _on_animated_sprite_2d_animation_finished() -> void:
	if Sprite.animation == "Fire":
		firing = false
		
		
