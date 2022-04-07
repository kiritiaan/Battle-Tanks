extends KinematicBody2D

var movement = Vector2();
export var movespeed = 250;
var bullet = preload("res://Bullet.tscn")
export var bullet_speed = 1000;

func _physics_process(_delta):
	
	#For firing
	if(Input.is_action_just_pressed("fire")):
		var bullet_instance = bullet.instance()
		bullet_instance.position = $Sprite/Bullet_Point.get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees + 90
		print(bullet_instance.rotation_degrees)
		print(rotation_degrees)
		bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed,0).rotated(rotation))
		get_tree().get_root().add_child(bullet_instance)
	
	# Movements of the tank
	#For Left and right
	if(movement.y == 0):
		movement.x = (Input.get_action_strength("move_right") - Input.get_action_strength("move_left")) * movespeed;
	#For Up and Down
	if(movement.x == 0):
		movement.y = (Input.get_action_strength("move_down") - Input.get_action_strength("move_up")) * movespeed;

	if(movement != Vector2.ZERO):
		set_rotation(movement.angle())
	
	
	movement = move_and_slide(movement)
	
