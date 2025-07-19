extends CharacterBody2D
@onready var animation = $AnimatedSprite2D
@onready var collider = $ CollisionShape2D
var speed = 10
func _ready():
	walking()
func walking():
	animation.play("Walking")
func _physics_process(delta):
	velocity.x = -speed  # Move left
	move_and_slide()

