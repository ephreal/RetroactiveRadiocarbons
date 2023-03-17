extends Node

var health = 100
var powers = {}
var double_speed_timer
var double_speed_duration = 20
var player_object
var player_sprite
var JUMP_FRAMES = 5
var DOUBLE_JUMPED

# Called when the node enters the scene tree for the first time.
func _ready():
	self.load_player_data("")
	self.double_speed_timer = Timer.new()
	self.double_speed_timer.one_shot = true
	self.add_child(self.double_speed_timer)
	self.double_speed_timer.connect("timeout", self.deactivate_double_speed)
	self.player_sprite = "res://Assets/characters/"

func load_player_data(path: String):
	# Loads the player data
	# Currently just places data into the powers
	
	self.powers['ceiling_grip'] = false
	self.powers['double_jump'] = false

func register_player(player: CharacterBody2D):
	# Registers the passed in object as the player.
	self.player_object = player

# Character Modifications
func respawn():
	# Respawns the player at the respawn point for the active level.
	# The level needs to be registered to GlobalVars.ACTIVE_LEVEL
	# before the respawn() function will work.
	var respawn_location = GameVars.ACTIVE_LEVEL.respawn_location
	player_object.position = respawn_location
	player_object.velocity.x = 0
	player_object.velocity.y = 0

# Powerup changes
func add_power(powerup):
	self.powers[powerup] = true

func remove_power(powerup: String):
	self.powers[powerup] = false

func add_speed_time(seconds):
	self.double_speed_timer.time_left += seconds

func activate_double_speed():
	if not self.powers.has("double_speed") or not self.powers['double_speed']:
		self.add_power("double_speed")
		self.double_speed_timer.start(self.double_speed_duration)
		GameVars.set_player_speed(400)
	else:
		var current = self.double_speed_timer.time_left
		self.double_speed_timer.stop()
		self.double_speed_timer.start(current + self.double_speed_duration)

func deactivate_double_speed():
	self.remove_power("double_speed")
	GameVars.set_player_speed(200)


# Player Movement
func check_jumping():
	if self.can_jump() and Input.is_action_just_pressed("jump"):
		player_object.velocity.y = -1 * GameVars.JUMP_SPEED
		if not (player_object.is_on_ceiling() and player_object.is_on_floor()) and self.JUMP_FRAMES <= 0:
			self.DOUBLE_JUMPED = true
			player_object.velocity.y = -0.91 * GameVars.JUMP_SPEED
	elif (Input.is_action_just_pressed("jump") or Input.is_action_just_pressed("ui_down")) and player_object.is_on_ceiling():
		player_object.velocity.y += GameVars.JUMP_SPEED / 2.0
	elif player_object.is_on_ceiling() and Player.powers["ceiling_grip"]:
		player_object.velocity.y = 0
	elif player_object.is_on_ceiling():
		player_object.velocity.y = 1


func can_jump():
	if player_object.is_on_floor():
		self.JUMP_FRAMES = 5
		self.DOUBLE_JUMPED = false
		return true
	
	if Player.powers['double_jump'] and not player_object.is_on_floor() and self.JUMP_FRAMES <= 0:
		if not self.DOUBLE_JUMPED:
			return true

	self.JUMP_FRAMES -= 1
	
	if self.JUMP_FRAMES > 0:
		return true
	
	return false
