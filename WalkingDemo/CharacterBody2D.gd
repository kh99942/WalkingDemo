#Beware! Super cool code bellow!

class_name Player
extends CharacterBody2D


const SPEED = 300.0

@onready var animation = $AnimatedSprite2D

func _physics_process(delta):

	var direction_horizontal = Input.get_axis("ui_left", "ui_right")
	if direction_horizontal:
		velocity.x = direction_horizontal * SPEED
		if (direction_horizontal > 0):
			animation.play("right")
		else:
			animation.play("left")	
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		
	
	
	var direction_vertical = Input.get_axis("ui_up", "ui_down")
	if direction_vertical:
		velocity.y = direction_vertical * SPEED
		if (direction_vertical < 0):
			animation.play("back")
		else:
			animation.play("front")
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
		if (direction_vertical==0 and direction_horizontal==0):
			animation.play("idle")	
	
	move_and_slide()
