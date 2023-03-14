extends Area2D


func _on_body_entered(_body):
	# Adds the ceiling grip power to the player
	# Removes the coin from the game.
	Audio.play_sfx("Pickup Coin.ogg")
	Player.add_power("ceiling_grip")
	self.queue_free()
