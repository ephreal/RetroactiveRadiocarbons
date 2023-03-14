extends Node

var health = 100
var powers = {}
var double_speed_timer
var double_speed_duration = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	self.load_player_data("")
	self.double_speed_timer = Timer.new()
	self.double_speed_timer.one_shot = true
	self.add_child(self.double_speed_timer)
	self.double_speed_timer.connect("timeout", self.deactivate_double_speed)

func load_player_data(path: String):
	# Loads the player data
	# Currently just places data into the powers
	
	self.powers['ceiling_grip'] = false
	self.powers['double_jump'] = false

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
