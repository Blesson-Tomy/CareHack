extends ColorRect

func _ready():
	var collision_shape = get_parent().get_node("CollisionShape2D")
	var shape = collision_shape.shape

	if shape is RectangleShape2D:
		size = shape.extents * 2
		position = collision_shape.position - shape.extents
