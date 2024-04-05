extends Area2D
class_name Enemy #Se especifica a la clase que pertenece. 
#Más información de clases buscar el video otra vez :I
@export var Dead = preload("res://Inicio.tscn") as PackedScene #Creación de la escena

var speed = 6 #Velocidad
var presa = null #Variable para hacer referencia al personaje (Fred)

func _ready():
	var an = $AnimatedSprite2D
	an.flip_h = false
	an.play("flys")#Llamada a la animación de la gaviota. 
	presa = get_tree().get_nodes_in_group("presa")[0] #Se asigna el valor de la posicion del personaje. 

func _process(delta: float) -> void:
	follow() #Llama a la función que indica la dirección del movimiento. 

func follow():
	if presa != null:
		global_position += (position.direction_to(presa.position)) * speed 
		#Hace uso de la posicion de la presa para indicar la direccion en que se debe desplazar. 
		#Crea el efecto de persecución.


#Función que se activa cuando se logra alcanzar al personaje. 
func _on_body_entered(body):
	if "BabyFred" in body.get_name():
		print("Fred")
		#get_tree().change_scene_to_packed(Dead) #Cambio de escena. 


func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print("leaf")
	
