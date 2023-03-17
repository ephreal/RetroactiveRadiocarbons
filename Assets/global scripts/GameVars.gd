extends Node

# Global Game Variables
const GRAVITY = 600

# Player variables that can be modified anywhere via scripts
var WALK_SPEED = 300
var JUMP_SPEED = 300

var ACTIVE_LEVEL




####################
# Variable Setters #
####################

# Yes, I know that I could modify them directly, but some things *should* be
# sanity checked first.

func set_player_speed(speed: int):
	# Sets the player speed to the value entered.
	# Min value = 100
	# Max value = 600
	
	if speed < 100:
		speed = 100
	elif speed > 500:
		speed = 500
	
	self.WALK_SPEED = speed

func register_active_level(level):
	# Sets the passed in variable to be the active level.
	self.ACTIVE_LEVEL = level
