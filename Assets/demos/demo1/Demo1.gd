extends Node2D
var bg_music = "level1.ogg"

# Called when the node enters the scene tree for the first time.
func _ready():
	Audio.music_player.volume_db = -10
	Audio.play(bg_music)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
