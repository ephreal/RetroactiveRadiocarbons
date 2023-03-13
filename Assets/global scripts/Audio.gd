extends Node
var music_player
var music_path = "res://Assets/audio/music/%s"
var sfx_path = "res://Assets/audio/sfx/%s"
var silence = -75.0
var sfx_player


# Called when the node enters the scene tree for the first time.
func _ready():
	music_player = AudioStreamPlayer.new()
	self.add_child(music_player)
	
	sfx_player = AudioStreamPlayer.new()
	sfx_player.max_polyphony = 20
	self.add_child(sfx_player)


func play(music: String):
	music = music_path % music
	music_player.stop()
	music_player.stream = load(music)
	music_player.play()


func play_sfx(sfx: String):
	sfx = sfx_path % sfx
	sfx_player.stream = load(sfx)
	sfx_player.play()
