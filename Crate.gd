extends KinematicBody2D

var s = preload("res://Splinter.tscn")
var splint
var count = 0
var player
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func set_player(user):
	player = user

func take_damage():
	var parent = get_parent()
	get_parent().remove_child(self)
	while(count < 20):
		count = count + 1
		splint = s.instance()
		splint.random_vel()
		splint.start(position,player)
		parent.add_child(splint)
	
