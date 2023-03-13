extends CharacterBody2D
var WALK_SPEED = 250
var JUMP_SPEED = 300
var JUMP_FRAMES = 5

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
	
	
	self.check_jumping()
	# "move_and_slide" already takes delta time into account.
	self.move_and_slide()


func check_jumping():
	if self.can_jump() and Input.is_action_just_pressed("jump"):
		velocity.y -= self.JUMP_SPEED
	elif (Input.is_action_just_pressed("jump") or Input.is_action_just_pressed("ui_down")) and self.is_on_ceiling():
		velocity.y += self.JUMP_SPEED / 2
	elif self.is_on_ceiling() and Player.powers["ceiling_grip"]:
		velocity.y = 0
	elif self.is_on_ceiling():
		velocity.y = 1


func can_jump():
	if self.is_on_floor():
		self.JUMP_FRAMES = 5
		return true
	
	self.JUMP_FRAMES -= 1
	
	if self.JUMP_FRAMES > 0:
		return true
	
