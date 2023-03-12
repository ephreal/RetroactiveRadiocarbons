extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var music_player = AudioStreamPlayer.new()
	music_player.stream = load("res://Assets/audio/music/Character Select.ogg")
	add_child(music_player)
	music_player.play()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
