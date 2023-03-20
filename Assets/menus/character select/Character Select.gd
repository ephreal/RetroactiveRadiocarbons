extends Control

var nyaa_chan = "res://Assets/characters/nyaa-chan/Nyaa-Chan.tscn"
var elzer = "res://Assets/characters/elzer/Elzer.tscn"
var genessa = "res://Assets/characters/genessa/Genessa.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_nyaa_select_pressed():
	var player = load(nyaa_chan).instantiate()
	Player.register_player(player)
	GameVars.change_scene("res://Assets/levels/level1/Level1.tscn")


func _on_genessa_select_pressed():
	var player = load(genessa).instantiate()
	Player.register_player(player)
	GameVars.change_scene("res://Assets/levels/level1/Level1.tscn")


func _on_elzer_select_pressed():
	var player = load(elzer).instantiate()
	Player.register_player(player)
	GameVars.change_scene("res://Assets/levels/level1/Level1.tscn")
