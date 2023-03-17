extends Area2D

# A Hidden Area that doesn't show the contents behind it.
# Requires you to add in a CollisionArea2D to specify where the hidden area
# is, and also requires you to add in a tilemap to it.
# This is mostly a helper to prevent code duplication.


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_body_entered(body):
	self.visible = false



func _on_body_exited(body):
	self.visible = true
