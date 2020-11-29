extends KinematicBody2D

export (int) var speed = 200
export var place_distance = 100
export var health = 100
var rect = Rect2()
var id = self
var has_key = false

var bomb = preload("res://Bomb.tscn")
var test = preload("res://Test.tscn")

var velocity = Vector2()

func _ready():
	pass_player()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
		rect = Rect2(0,0,32,32)
		get_node("Sprite").set_region_rect(rect)
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
		rect = Rect2(64,0,32,32)
		get_node("Sprite").set_region_rect(rect)
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
		rect = Rect2(32,0,32,32)
		get_node("Sprite").set_region_rect(rect)
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
		rect = Rect2(32,0,32,32)
		get_node("Sprite").set_region_rect(rect)
	if Input.is_action_just_pressed('mouse_click'):
		place()
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	get_parent().get_node("Player")

func place():
	var b = bomb.instance()
	var crates = get_parent().get_node("Crates")
	b.start(get_global_mouse_position(),position,crates,place_distance,self)
	get_parent().add_child(b)

func pass_player():
	var key = get_parent().get_node("Key")
	key.set_player(self)
	var finish = get_parent().get_node("Finish")
	finish.set_player(self)
	var crates = get_parent().get_node("Crates").get_children()
	for crate in crates:
		crate.set_player(self)

func take_damage():
	health -= 10
	$Healthbar.value = health
	if(health <= 0):
		get_tree().reload_current_scene()
	


func _on_Timer_timeout():
	get_tree().reload_current_scene()

