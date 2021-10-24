extends KinematicBody2D

export (int) var speed = 120 #Velocidad del player
var iniciar : bool = false #Juego en curso
var movimiento : Vector2 = Vector2() #movimiento del player
var limite : Vector2 = Vector2() #Limite de la pantalla

func _ready():
	limite= get_viewport_rect().size #Inicializar la variable, obteniendo el tamaño de la pantalla

func _physics_process(delta):
	movement(delta) #usado la funcion de movimiento del player
	limitScreen() #usando la funcion de limite de pantalla para que el player no salga de esta pantalla

func movement(_delta):
	movimiento = Vector2()	#Resetear valores del movimiento
	if Input.is_action_pressed("rigth"):
		movimiento.x += 1
	if Input.is_action_pressed("left"):
		movimiento.x -= 1
	if Input.is_action_pressed("up"):
		movimiento.y -= 1
	if Input.is_action_pressed("down"):
		movimiento.y += 1
	#Si en la variable movimiento : Vector2, su length sea > 0
	if movimiento.length() > 0:
		movimiento=movimiento.normalized() * speed #Normalizar el movimiento para que cuando se presionen 2 teclas, este no aumente * 2 su velocidad
	position += movimiento*_delta #Mover al player

func limitScreen():
	#Limitar al personaje
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
