extends CharacterBody2D

@export var speed = 400
@export var jump_speed = -900
@export var gravity = 3000
@export var life = 5

func _physics_process(delta):
	moving(delta)
	lifecheck()
	#catch_a_shot()

#func catch_a_shot():
	

func lifecheck():
	if self.life <= 0:
		queue_free()

func moving(delta):
	velocity.y += gravity * delta
	move_and_slide()

func take_damage(val):
	self.life -= val


func _on_body_area_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	pass
	#print(area.shape_find_owner(area_shape_index))
