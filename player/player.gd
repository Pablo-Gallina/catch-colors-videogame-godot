extends KinematicBody2D

export (int) var distance_mov = 64 #Velocidad del player
var iniciar : bool = false #Juego en curso
var limite : Vector2 = Vector2() #Limite de la pantalla
var movimiento : int = 0
var col_path : int = 1

func _ready():
	limite= get_viewport_rect().size #Inicializar la variable, obteniendo el tamaño de la pantalla
func _physics_process(delta):
	movement(delta) #usado la funcion de movimiento del player

func movement(_delta):
	if Input.is_action_just_pressed("rigth"):
		position.x += distance_mov
		col_path +=1
	if Input.is_action_just_pressed("left"):
		position.x -= distance_mov
		col_path +=1
	if Input.is_action_just_pressed("up"):
		position.y -= distance_mov
		col_path +=1
	if Input.is_action_just_pressed("down"):
		position.y += distance_mov  
		col_path +=1 
	game_over()
"""func animation():
	if movimiento.x != 0:
		$AnimatedSprite.animation='move'
		$AnimatedSprite.flip_h= movimiento.x<0
	elif movimiento.y !=0:
		$AnimatedSprite.animation='move'
		$AnimatedSprite.flip_h= movimiento.y<0
	else:
		$AnimatedSprite.animation='idle'"""
func game_over():
	if movimiento<col_path:
		print("game over")
	else:
		print("Continua", movimiento, col_path)

func _on_path2_body_entered(body):
	movimiento += 1
