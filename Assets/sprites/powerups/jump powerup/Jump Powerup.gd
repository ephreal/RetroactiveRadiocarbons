extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	# Adds the ceiling grip power to the player
	# Removes the coin from the game.
	Audio.play_sfx("Pickup Coin.ogg")
	Player.add_power("double_jump")
	self.queue_free()
