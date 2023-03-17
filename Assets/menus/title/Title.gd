extends CanvasLayer

var bg_music = "Character Select.ogg"
var level_length = 1152
var player

func _ready():
	Audio.music_player.volume_db = -10
	Audio.play(bg_music)
	
	self.player = self.get_node("Player")
	self.player.set_camera_end(self.level_length)
	Player.register_player(self.get_node("Player"))
	GameVars.register_active_level(self)
