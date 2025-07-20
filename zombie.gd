extends CharacterBody2D
@onready var animation = $AnimatedSprite2D
@onready var collider = $ CollisionShape2D
var speed = 10
var hp=5
var naming = "zombie"
var eat =0
func _ready():
	check_state()
func check_state():
	if eat==0:
		walking()
	else:
		eating()
func eating():
	if hp==0:
		self.queue_free()
	speed=0
	animation.play("Eating")	
func walking():
	if hp==0:
		self.queue_free()
	animation.play("Walking")

func _physics_process(delta):
	velocity.x = -speed  # Move left
	move_and_slide()


