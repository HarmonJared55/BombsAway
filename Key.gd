extends Area2D

var player

func set_player(user):
	player = user

func _on_Key_body_entered(body):
	if(body == player):
		player.has_key = true
		print(player.has_key)
		get_parent().remove_child(self)

