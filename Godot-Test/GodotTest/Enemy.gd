extends StaticBody2D

# 移動速度
var velocity = Vector2(-100, 0)

func _process(delta):
	# 位置に速度を足し込む
	position += velocity * delta
