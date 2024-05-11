class_name Player
extends CharacterBody2D


const SPEED = 300.0

@onready var animation = $AnimatedSprite2D

func _physics_process(delta):

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if (direction > 0):
			animation.play("right")
		else:
			animation.play("left")	
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		
	
	
	var direction1 = Input.get_axis("ui_up", "ui_down")
	if direction1:
		velocity.y = direction1 * SPEED
		if (direction1 < 0):
			animation.play("back")
		else:
			animation.play("front")	
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
		if (direction1==0 and direction==0):
			animation.play("idle")	
	
	move_and_slide()
