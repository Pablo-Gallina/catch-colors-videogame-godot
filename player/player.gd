extends KinematicBody2D

export (int) var speed = 120
const RIGHT : int = 1 #movimiento
const LEFT : int = -1 #movimiento
var iniciar : bool = false
var movimiento : Vector2 = Vector2()
var limite

func _ready():
	limite= get_viewport_rect().size
	pass

func _physics_process(delta):
	movement(delta)
	limitScreen()

func movement(_delta):
	movimiento = Vector2()	
	if Input.is_action_pressed("rigth"):
		movimiento.x += 1
	if Input.is_action_pressed("left"):
		movimiento.x -= 1
	if Input.is_action_pressed("up"):
		movimiento.y -= 1
	if Input.is_action_pressed("down"):
		movimiento.y += 1
	if movimiento.length() > 0:
		movimiento=movimiento.normalized() * speed
	position += movimiento*_delta

func limitScreen():
	position.x= clamp(position.x,18,limite.x-15)
	position.y= clamp(position.y,20,limite.y-27)	

"""func animation():
	if movimiento.x != 0:
		$AnimatedSprite.animation='move'
		$AnimatedSprite.flip_h= movimiento.x<0
	elif movimiento.y !=0:
		$AnimatedSprite.animation='move'
		$AnimatedSprite.flip_h= movimiento.y<0
	else:
		$AnimatedSprite.animation='idle'"""
