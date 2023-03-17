extends CharacterBody2D
var JUMP_FRAMES = 5
var DOUBLE_JUMPED = false
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
	
	
	self.check_jumping()
	# "move_and_slide" already takes delta time into account.
	self.move_and_slide()


func check_jumping():
	if self.can_jump() and Input.is_action_just_pressed("jump"):
		velocity.y = -1 * GameVars.JUMP_SPEED
		if not (self.is_on_ceiling() and self.is_on_floor()) and self.JUMP_FRAMES <= 0:
			self.DOUBLE_JUMPED = true
			velocity.y = -0.91 * GameVars.JUMP_SPEED
	elif (Input.is_action_just_pressed("jump") or Input.is_action_just_pressed("ui_down")) and self.is_on_ceiling():
		velocity.y += GameVars.JUMP_SPEED / 2.0
	elif self.is_on_ceiling() and Player.powers["ceiling_grip"]:
		velocity.y = 0
	elif self.is_on_ceiling():
		velocity.y = 1


func can_jump():
	if self.is_on_floor():
		self.JUMP_FRAMES = 5
		self.DOUBLE_JUMPED = false
		return true
	
	if Player.powers['double_jump'] and not self.is_on_floor() and self.JUMP_FRAMES <= 0:
		if not self.DOUBLE_JUMPED:
			return true

	self.JUMP_FRAMES -= 1
	
	if self.JUMP_FRAMES > 0:
		return true
	
	return false


func set_camera_end(end: int):
	self.camera.limit_right = end
