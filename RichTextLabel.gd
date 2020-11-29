extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	$Timer.time_left
	set_text(str($Timer.time_left))


func _on_Timer_timeout():
	pass # Replace with function body.
