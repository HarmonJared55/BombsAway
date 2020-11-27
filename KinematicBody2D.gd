extends KinematicBody2D

export (int) var speed = 200

var bomb = preload("res://Bomb.tscn")

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	if Input.is_action_just_pressed('mouse_click'):
		place()
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

func place():
	var b = bomb.instance()
	b.start(get_global_mouse_position())
	get_parent().add_child(b)
	
