extends Area2D

var timer
var collision

func _ready():
	self.timer = self.get_node("Timer")
	self.collision = self.get_node("CollisionShape2D")

func _on_body_entered(_body):
	# Adds the double speed power to the player
	# Removes the coin from the game.
	Audio.play_sfx("Pickup Coin.ogg")
	Player.activate_double_speed()
	self.timer.start(10)
	self.set_deferred("monitoring", false)
	self.visible = false


func _on_timer_timeout():
	self.set_deferred("monitoring", true)
	self.visible = true
