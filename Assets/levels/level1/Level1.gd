extends Node2D
var player
var next_level = null
var music = "level1.ogg"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.player = Player.player_object
	self.add_child(player)
	Audio.play(music)
	GameVars.register_active_level(self)
