extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _process(delta):
	position.x = lerp(position.x, position.x + 100, delta * 4)
	rotation = lerp(rotation, rotation + 50, delta * 4)
