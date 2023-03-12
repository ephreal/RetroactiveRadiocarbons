extends Node

# JSON dict containing all settings
var settings_path = "user://settings.json"
var settings = {}

# Audio Volume: Float
var music_volume
var sfx_volume
var MAX_VOLUME = 1.0
var MIN_VOLUME = 0.0

func _ready():
	self.load_settings()
	self.set_music_volume(self.settings['audio']['music_volume'])

func load_settings():
	var file
	if FileAccess.file_exists(settings_path):
		file = FileAccess.open(self.settings_path, FileAccess.READ)
		file = file.get_as_text()
		self.settings = JSON.parse_string(file)
	
	else:
		# Create the default settings.
		var defaults = self.get_defaults()
		file = FileAccess.open(self.settings_path, FileAccess.WRITE)
		file.store_string(JSON.stringify(defaults))
		self.settings = defaults


func get_defaults():
	# Gets the default values for the settings and returns them in
	# a dict.
	
	var defaults = {
		"audio": {
			"music_volume" = 1.0,
			"sfx_volume" = 1.0
		}
	}
	
	return defaults

func set_music_volume(volume: float):
	# Sets the music volume.
	if volume > MAX_VOLUME:
		volume = 1.0
	elif volume < MIN_VOLUME:
		volume = 0.0
	
	self.music_volume = volume
	Audio.music_player.volume_db = (1 - self.music_volume) * Audio.silence


func set_sfx_volume(volume: float):
	# Sets the music volume.
	if volume > MAX_VOLUME:
		volume = 1.0
	elif volume < MIN_VOLUME:
		volume = 0.0
	
	self.sfx_volume = volume
	Audio.sfx_player.volume_db = (1 - self.music_volume) * Audio.silence
