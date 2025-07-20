extends Area2D
var spawn_timer := Timer.new()
var hp=10
@onready var animation  = $AnimatedSprite2D

func _ready():
	animation.play("Idle")
	spawn_timer.wait_time = 2
	spawn_timer.one_shot = false
	if not spawn_timer.is_connected("timeout", Callable(self, "spawn_projectile")):
		spawn_timer.connect("timeout", Callable(self, "spawn_projectile"))
	add_child(spawn_timer)
	fight()

func fight():
	if hp==0:
		self.queue_free()
	animation.play("Attack")
	spawn_timer.start()

func spawn_projectile():
	var projectile = preload("res://pea.tscn").instantiate()
	print("Projectile spawned at: ", projectile.global_position)
	get_parent().add_child(projectile)
	projectile.global_position = global_position + Vector2(40,-10)
func _on_body_entered(body):
	print(body.name)
	if "eat" in body and "check_state" in body:
		body.eat = 1
		body.check_state()
		hp-=1
