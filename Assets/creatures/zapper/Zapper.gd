extends CharacterBody2D


const SPEED = 300.0
const ROTATION_SPEED = 1

var patrol_amount = 0
var selection
var options
var animations
var attacking
var firing_point
var firing_timer
var blaster = preload("res://Assets/creatures/zapper/Zapper Blast.tscn")

func _ready():
	self.selection = RandomNumberGenerator.new()
	self.selection.randomize()
	self.animations = self.get_node("AnimatedSprite2D")
	self.options = ["patrol", "think"]
	self.attacking = false
	self.firing_point = self.get_node("AnimatedSprite2D/FirePoint")
	self.firing_timer = self.get_node("FiringTimer")

func animate():
	self.animations.stop()
	
	if self.animations.animation == "turn":
		self.swap_h()
	
	# If this zapper is patrolling, lower the amount of times it should
	# continue to patrol before continuing on.
	if self.patrol_amount > 0:
		self.patrol_amount -= 1
		return
	
	if self.attacking:
		self.attacking = false


func blast():
	var zapper_blast = self.blaster.instantiate()
	self.get_parent().add_child(zapper_blast)
	zapper_blast.position = self.firing_point.global_position

func attack():
	self.animations.play("zap")
	self.firing_timer.start(1)
	self.attacking = true


func swap_h():
	# Toggles the flip_h var
	if self.animations.flip_h:
		self.animations.flip_h = false
	else:
		self.animations.flip_h = true
	
	self.animations.play("idle")

func turn_around():
	self.animations.play("turn")

func _process(_delta):
	if self.near_player() and not self.attacking:
		pass

func near_player():
	var distance = Player.player_object.global_position - self.global_position
	if distance.length() < 400:
		return true
	return false

func face_player(delta):
	var direction = Player.player_object.global_position - self.global_position
	var angle_to = $AnimatedSprite2D.transform.x.angle_to(direction)
	$AnimatedSprite2D.rotate(sign(angle_to) * min(delta * self.ROTATION_SPEED, abs(angle_to)))

func _physics_process(delta):
	if self.near_player():
		# Rotate to face the player
		self.face_player(delta)
		if not self.attacking:
			self.attack()
	move_and_slide()


func _on_firing_timer_timeout():
	self.blast()
