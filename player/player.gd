extends KinematicBody2D

export (int) var distance_mov = 8 #Velocidad del player
var iniciar : bool = false #Juego en curso
var movimiento : Vector2 = Vector2() #movimiento del player
var limite : Vector2 = Vector2() #Limite de la pantalla

func _ready():
	limite= get_viewport_rect().size #Inicializar la variable, obteniendo el tamaño de la pantalla

func _physics_process(delta):
	movement(delta) #usado la funcion de movimiento del player

func movement(_delta):
	movimiento = Vector2()	#Resetear valores del movimiento
	if Input.is_action_pressed("rigth"):
		position.x += distance_mov
	if Input.is_action_pressed("left"):
		position.x -= distance_mov
	if Input.is_action_pressed("up"):
		position.y -= distance_mov
	if Input.is_action_pressed("down"):
		position.y += distance_mov

"""func animation():
	if movimiento.x != 0:
		$AnimatedSprite.animation='move'
		$AnimatedSprite.flip_h= movimiento.x<0
	elif movimiento.y !=0:
		$AnimatedSprite.animation='move'
		$AnimatedSprite.flip_h= movimiento.y<0
	else:
		$AnimatedSprite.animation='idle'"""
