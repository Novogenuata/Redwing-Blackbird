extends Area2D

@export var speed = 1000
var velocity: Vector2 = Vector2.ZERO 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = position + transform.x * speed * delta
