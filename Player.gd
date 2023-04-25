extends KinematicBody2D

#重力
const GRAVITY_POWER := 1000

#ジャンプ力
const JUMP_POWER := -400

#移動速度
var velocity := Vector2()

#ジャンプできるかどうか
var can_jump := true

#スプライト
onready var sprite := $sprite

func _process(delta):
	#移動処理を行う
	_update_moving(delta)
	
	#アニメーション処理
	_update_anim(delta)
	
func _update_moving(delta):
	#重力を計算
	velocity.y += GRAVITY_POWER * delta
	
	if Input.is_action_just_pressed("ui_accept"):
		#Spaceキーでジャンプ
		velocity.y = JUMP_POWER
		
	if position.y < 0:
		#画面上部にはみ出さないようにする
		velocity.y = 100
		
	if position.y > 600-64:
		#画面下部に落ちないようにする
		velocity.y = JUMP_POWER
	#移動処理
	move_and_collide(velocity * delta)
	
func _update_anim(delta):
	#基本
	sprite.frame = 0
	if velocity.y < 0:
	#上昇中
		sprite.frame = 1
