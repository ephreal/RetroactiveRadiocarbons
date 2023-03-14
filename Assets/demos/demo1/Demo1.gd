extends Node2D
var bg_music = "level1.ogg"
var hidden_area
var level_length = 2622
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	Audio.music_player.volume_db = -10
	Audio.play(bg_music)
	
	self.player = self.get_node("Player")
	self.player.set_camera_end(self.level_length)
	self.hidden_area = self.get_node("HiddenArea")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_hidden_area_body_entered(_body):
	self.hidden_area.visible = false


func _on_hidden_area_body_exited(_body):
	self.hidden_area.visible = true
