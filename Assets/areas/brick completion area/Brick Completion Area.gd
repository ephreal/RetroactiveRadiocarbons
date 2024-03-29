extends Node2D
var timer
var time = 0
var time_label

# Called when the node enters the scene tree for the first time.
func _ready():
	self.timer = self.get_node("CompletionTimer")
	self.timer.start(1)
	self.time_label = self.get_node("Time/Time")

func _on_area_2d_body_entered(_body):
	self.timer.stop()
	var minutes = "00"
	var seconds
	if self.time > 60:
		minutes = self.time / 60
		seconds = self.time % 60
	else:
		seconds = self.time

	if seconds < 10:
		seconds = "0" + str(seconds)

	self.time_label.text = str(minutes) + ":" + str(seconds)


func _on_completion_timer_timeout():
	self.time += 1
