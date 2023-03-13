extends Node

var health = 100
var powers = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	self.load_player_data("")


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
