extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_body_entered(_body):
	var next = GameVars.ACTIVE_LEVEL.next_level
	
	if next == null:
		# Nothing to do yet
		return
	
	GameVars.change_scene(next)
