extends Area2D

var player
var level_count = 1

func set_player(user):
	player = user
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	


func _on_Finish_body_entered(body):
	print("hi")
	#var l = l2.instance()
	#get_parent().get_parent().add_child(l)
	#get_parent().get_parent().remove_child(get_parent())
