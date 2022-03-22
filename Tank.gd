extends KinematicBody2D

var movement = Vector2();
var movespeed = 200;

func _physics_process(_delta):
	
	# Movements of the tank
	#For Left and right
	if(movement.y == 0):
		movement.x = (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) * movespeed;
		
		#Rotating the tank Left And Right
		if(movement.x == 0):
			pass
		if(Input.is_action_pressed("ui_left") && !Input.is_action_pressed("ui_right")):
			$Sprite.set_rotation(-1.5708)
		elif(Input.is_action_pressed("ui_right") && !Input.is_action_pressed("ui_left")):
			$Sprite.set_rotation(1.5708)
	
	#For Up and Down
	if(movement.x == 0):
		movement.y = (Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")) * movespeed;
		
		#Rotating the tank Up and Down
		if(movement.y == 0):
			pass
		if(Input.is_action_pressed("ui_up") && !Input.is_action_pressed("ui_down")):
			$Sprite.set_rotation(0)
		elif(Input.is_action_pressed("ui_down") && !Input.is_action_pressed("ui_up")):
			$Sprite.set_rotation(-3.14159)
	
	
	movement = move_and_slide(movement)
	
