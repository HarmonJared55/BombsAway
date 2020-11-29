extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var vel = Vector2(1,1)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	var collison = move_and_collide(vel)
	if collison:
		get_parent().remove_child(self)
		
func set_pos(pos):
	position = pos
