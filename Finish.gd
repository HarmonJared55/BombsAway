extends Area2D

var player
var level_count = 1

func set_player(user):
	player = user
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	


func _on_Finish_body_entered(body):
	print("hello")
	if(body == player && player.has_key):
	#var l = l2.instance()
	#get_parent().get_parent().add_child(l)
		get_tree().change_scene("res://Level2.tscn")
