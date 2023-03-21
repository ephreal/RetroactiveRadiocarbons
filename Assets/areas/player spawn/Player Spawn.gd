extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.spawn()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawn():
	self.get_parent().add_child.call_deferred(Player.player_object)
	Player.player_object.position = self.position

func respawn():
	Player.player_object.position = self.position
