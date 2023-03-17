extends CharacterBody2D
var camera

# Apparently there's a default gravity setting. I may need to use this!
# var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

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
