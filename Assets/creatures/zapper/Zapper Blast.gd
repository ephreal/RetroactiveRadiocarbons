extends CharacterBody2D

var timer
const SPEED = 200

func _ready():
	self.timer = self.get_node("Timer")
	self.look_at(Player.player_object.global_position)
	self.timer.start(5)

func _physics_process(delta):
	# Add the gravity.

	move_and_slide()


func _on_timer_timeout():
	self.call_deferred("free")
