extends Node2D
var bg_music = "level1.ogg"
var hidden_area
var level_length = 2622
var player

var respawn_location = Vector2(736, 287)

# Called when the node enters the scene tree for the first time.
func _ready():
	Audio.music_player.volume_db = -10
	Audio.play(bg_music)
	
	self.player = self.get_node("Player")
	self.player.set_camera_end(self.level_length)
	self.hidden_area = self.get_node("HiddenArea")
	Player.register_player(self.get_node("Player"))
	GameVars.register_active_level(self)


func _on_hidden_area_body_entered(_body):
	self.hidden_area.visible = false


func _on_hidden_area_body_exited(_body):
	self.hidden_area.visible = true


func _on_hidden_area_body_entered_extend_camera(body):
	self.player.set_camera_end(self.get_node('Sky').size.x)
