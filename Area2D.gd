extends Area2D
var naming = "pea"
func _on_body_entered(body):
	print("Hit: ", body.name)
	body.hp-=1
	body.check_state()
	print(body.hp)
	self.queue_free()
func _physics_process(delta):
	position += Vector2(100, 0) * delta
