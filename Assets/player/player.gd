extends CharacterBody2D
var WALK_SPEED = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	
	velocity.y += delta * GameVars.GRAVITY

	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
	else:
		velocity.x = 0
		
	if Input.is_action_just_pressed("jump"):
		velocity.y -= WALK_SPEED

	# "move_and_slide" already takes delta time into account.
	self.move_and_slide()
