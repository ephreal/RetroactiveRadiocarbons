extends CharacterBody2D

var SPEED = 150
var animation
var options
var rng

# Called when the node enters the scene tree for the first time.
func _ready():
	self.animation = self.get_node("AnimatedSprite2D")
	self.options = ["left", "right", "blink",]
	self.rng = RandomNumberGenerator.new()
	self.rng.randomize()
	self.choose_option()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	
	self.velocity.y += GameVars.GRAVITY
	if self.is_on_wall():
		self.animation.stop()
		self.choose_option()
	self.move_and_slide()

func blink():
	self.velocity.x = 0
	self.animation.play("Blink")


func move_right():
	self.velocity.x = self.SPEED
	self.animation.flip_h = true
	self.animation.play("Hop")


func move_left():
	self.velocity.x = -1 * self.SPEED
	self.animation.flip_h = false
	self.animation.play("Hop")


func choose_option():
	var opt = self.rng.randi_range(0, 2)
	var option = self.options[opt]
	
	match option:
		"left":
			self.move_left()
		"right":
			self.move_right()
		"blink":
			self.blink()


func _on_animated_sprite_2d_animation_looped():
	self.animation.stop()
	self.choose_option()
