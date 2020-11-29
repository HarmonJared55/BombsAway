extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var place_distance = 0
var containers
export var explosive_range = 50
var aim
var player
var motion
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _draw():
	draw_circle(Vector2(),explosive_range,Color8(255,0,0,100))

func _physics_process(delta):
	get_node("AnimatedSprite").set_speed_scale(get_node("AnimatedSprite").get_speed_scale()*1.1)
	move_and_collide((motion)*3.5)

func start(pos,playerpos,crates,place_distance,user):
	player = user
	containers = crates	
	position = playerpos
	aim = pos
	motion = (aim - position).normalized()
		
func explode():
	print("Method explode")
	
	var crates = containers.get_children()
	if(player.position.distance_to(position) <= explosive_range):
		player.take_damage()
	for crate in crates:
		if(crate.position.distance_to(position) <= explosive_range):
			crate.take_damage()
	get_parent().remove_child(self)
	
func _on_Timer_timeout():
	explode()
