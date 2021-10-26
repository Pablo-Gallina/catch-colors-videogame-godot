#En el nodo de transicion
extends CanvasLayer
 
onready var color_rec : ColorRect = $color #Seleccionar el nodo color rect
onready var tween_node : Tween = $nodo #Seleccionar el nodo tween para las animaciones

#sobreescribir la funcion para cambiar la escena
func change_scene_loc(path : String) -> void:
	layer = 1 #al iniciar el layer debe estar sobre todos
	#fade in
	print(tween_node)
	#Parámetros, 1 propiedad a animar,2 propiedad, 3 valor inicial del color,4 valor final del color y 5 la durcaion
	tween_node.interpolate_property(color_rec,"color",
									Color("00000000"),
									Color("000000"),0.5)
	tween_node.start() #Comenzar la interpolacion
	yield(tween_node,"tween_completed")
	#Cambio de escena
	get_tree().change_scene(path) #Cambiar de escena
	#fade out
	tween_node.interpolate_property(color_rec,"color",
									Color("000000"),
									Color("00000000"),0.5)
	tween_node.start()
	yield(tween_node,"tween_completed")
	layer = -1 #al finalizar que el layer este debajo de todos
# Called when the node enters the scene tree for the first time.
func _ready():
	layer = -1 #colocar el layer por detras de todo, para que no afecte a los demas elementos
