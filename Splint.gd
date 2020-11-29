extends KinematicBody2D

var vel = Vector2()
var bounce_count = 0
var speed = 25
var player

func start(pos,user):
	position = pos
	player = user

func _physics_process(delta):
	var collison = move_and_collide(vel)
	if collison:
		if(collison.collider == player):
			player.take_damage()
		if(bounce_count < 10 && speed > 5):
			bounce_count = bounce_count + 1
			#bounce
			speed = speed*.5
			vel = vel.bounce(collison.normal).normalized()*speed
		else:
			get_parent().remove_child(self)

func random_vel():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var x = rng.randi_range(-10,10)
	var y = rng.randi_range(-10,10)
	vel = (Vector2(x,y) - position).normalized() * speed

func take_damage():
	print("haha do nothing")


func _on_Timer_timeout():
	get_parent().remove_child(self)
