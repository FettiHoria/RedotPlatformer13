extends CharacterBody2D

@export var speed = 400
@export var jump_speed = -900
@export var gravity = 3000

var bullet = preload("res://bullet.tscn")

var orientation = 1
var can_dash: bool = true
var can_shoot: bool = true

func _physics_process(delta):
	moving(delta)
	jumping()
	shooting()
	dashing()
	
	#print(velocity.x)


func moving(delta):
	velocity.y += gravity * delta
	velocity.x = Input.get_axis("walk_left", "walk_right") * speed
	if Input.is_action_just_pressed("walk_left"):
		orientation = -1
	if Input.is_action_just_pressed("walk_right"):
		orientation = 1
	move_and_slide()

func jumping():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_speed

func shooting():
	 #and can_shoot == true
	if Input.is_action_just_pressed("shoot") and can_shoot == true:
		var bullet_instance = bullet.instantiate() as Node2D
		bullet_instance.global_position = self.global_position
		bullet_instance.direction = self.orientation
		if (velocity.x != 0):
			bullet_instance.need_bloom = true
		else:
			bullet_instance.need_bloom = false
		get_parent().add_child(bullet_instance)
		can_shoot = false

func dashing():
	if Input.is_action_just_pressed("dash") and can_dash == true:
		self.speed = 2000
		can_dash = false


func _on_dash_timer_timeout():
	self.speed = 400


func _on_dash_cooldown_timer_timeout():
	can_dash = true


func _on_shoot_cooldown_timer_timeout():
	can_shoot = true
