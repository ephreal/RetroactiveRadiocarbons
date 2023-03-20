extends Node

# Global Game Variables
const GRAVITY = 600

# Player variables that can be modified anywhere via scripts
var WALK_SPEED = 300
var JUMP_SPEED = 300

var ACTIVE_LEVEL

var CHARACTER_SELECT
var TITLE
var ROOT
var TREE

func _ready():
	self.CHARACTER_SELECT = "res://Assets/menus/character select/Character Select.tscn"
	self.TITLE = "res://Assets/menus/title/Title.tscn"
	self.ROOT = self.get_tree().get_root()
	self.TREE = self.get_tree()


func change_scene(path: String):
	# Changes the scene to the passed in path
	var current = self.TREE.get_current_scene()
	current.call_deferred("free")
	self.ROOT.remove_child(current)
	
	var next = load(path)
	next = next.instantiate()
	self.ROOT.add_child(next)
	self.TREE.set_current_scene(next)

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
