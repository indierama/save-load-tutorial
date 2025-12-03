extends CharacterBody2D

@export var speed: float
@export var jump_speed: float
@export var gravity: float

@onready var animated_sprite = $AnimatedSprite

var is_facing_right = true


func _physics_process(delta):
	jump(delta)
	move_x()
	flip()
	update_animations()
	move_and_slide()


func update_animations():
	if not is_on_floor():
		if velocity.y < 0:
			animated_sprite.play("jump")
		else:
			animated_sprite.play("fall")
		return
	
	if velocity.x:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")


func jump(delta):
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_speed
	
	if not is_on_floor():
		velocity.y += gravity * delta


func flip():
	if (is_facing_right and velocity.x < 0) or (not is_facing_right and velocity.x > 0):
		scale.x *= -1
		is_facing_right = not is_facing_right


func move_x():
	var input_axis = Input.get_axis("left", "right")
	velocity.x = input_axis * speed
