extends CharacterBody2D


const SPEED = 200

func _physics_process(delta):
	# Add the gravity.

	move_and_slide()
