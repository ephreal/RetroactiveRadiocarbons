extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(_body):
	# Adds the double jump power to the player
	# Removes the coin from the game.
	Audio.play_sfx("Pickup Coin.ogg")
	Player.add_power("double_jump")
	self.queue_free()
