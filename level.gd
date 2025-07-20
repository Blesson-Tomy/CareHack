extends Node2D
@onready var zombies = preload("res://zombie.tscn")
@onready var sun1_scene = preload("res://sun_1.tscn") # Drag Sun1.tscn to this in Inspector
var spawn_interval := 5  # 5 minutes in seconds
@onready var ground = get_node("ground/CollisionShape2D")
@onready var rect_shape = ground.shape

func _ready():
	start_spawn_timer()

func start_spawn_timer():
	var timer = Timer.new()
	timer.wait_time = spawn_interval
	timer.one_shot = false
	timer.connect("timeout", Callable(self, "_on_spawn_timer_timeout"))
	add_child(timer)
	timer.start()

func _on_spawn_timer_timeout():
	spawn_sun1()
	spawn_zombie()

func spawn_sun1():
	var sun = sun1_scene.instantiate()
	add_child(sun)
	sun.position = Vector2(randi_range(200, 700), -200)
func spawn_zombie():
	var zombie = zombies.instantiate()
	add_child(zombie)
	if rect_shape is RectangleShape2D:
			var end_position = ground.global_position + Vector2(rect_shape.extents.x, -100)
			zombie.position = end_position



