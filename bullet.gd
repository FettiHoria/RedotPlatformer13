extends Sprite2D


var speed : int = 4000
#default nu e 1
var direction
var need_bloom: bool = false
var rng = RandomNumberGenerator.new()

func _physics_process(delta):
	if need_bloom == true:
		var bloom = rng.randf_range(-10.0, 10.0)
		move_local_y(bloom)
	move_local_x(direction * speed * delta)


func _on_timer_timeout():
	queue_free()
