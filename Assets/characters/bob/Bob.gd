extends CharacterBody2D
var camera

# Called when the node enters the scene tree for the first time.
func _ready():
	self.camera = self.get_node("camera")


func _physics_process(delta):
	
	velocity.y += delta * GameVars.GRAVITY

	if Input.is_action_pressed("ui_left"):
		velocity.x = -GameVars.WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  GameVars.WALK_SPEED
	else:
		velocity.x = 0
	
	
	Player.check_jumping()
	# "move_and_slide" already takes delta time into account.
	self.move_and_slide()


func set_camera_end(end: int):
	self.camera.limit_right = end
