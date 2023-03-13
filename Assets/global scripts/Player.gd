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

# Powerup changes
func add_ceiling_grip():
	self.powers['ceiling_grip'] = true

func remove_ceiling_grip():
	self.powers['ceiling_grip'] = false
