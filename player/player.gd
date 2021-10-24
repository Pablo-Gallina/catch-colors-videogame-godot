extends KinematicBody2D

export (int) var speed = 60
const RIGHT : int = 1 #movimiento
const LEFT : int = -1 #movimiento
var iniciar : bool = false
var movimiento : Vector2 = Vector2()


func _ready():
	pass

func _physics_process(delta):
	movement(delta)

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
