extends CharacterBody2D
#Creacion de las variables y asignación de valores. 
var speed = 500
var current_dir = "none"
#var fredPos  #Posiblemente se puede eliminar (Revisar)

@export var Dead = preload("res://Dead_2.tscn") as PackedScene #Creación de la escena

func _ready(): #Lo hice así para que  la animación de inicio quede en la dirección correcta. 
	var an = $AnimatedSprite2D
	an.flip_h = false
	an.play("swim")

#El movimiento del personaje. 
func _physics_process(delta): 
	velocity.x = speed
	velocity.y = 0
	#fredPos = global_transform.origin #asiganación y actualizacion de la posición. (para poder jugar con la direccion y persecución)
	move_and_slide()
	personaje_movement(delta) #Llamada ala función de los movimientos. 

#Los movimientos del personaje. 
func personaje_movement(delta):
	
	if Input.is_action_pressed("ui_right"):
		current_dir = "fast"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_up"):
			current_dir = "up"
			play_anim(1)
			velocity.x = 0
			velocity.y = -speed
	elif Input.is_action_pressed("ui_down"):
			current_dir = "down"
			play_anim(1)
			velocity.x = 0
			velocity.y = speed
	elif Input.is_action_pressed("ui_accept"):
			current_dir = "up"
			play_anim(1)
			velocity.x = 0
			velocity.y = -speed
	else: 
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()

#Animación de los movimientos. 
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "fast":
		anim.flip_h = false
		if movement == 1:
			anim.play("swim")
		elif movement == 0: 
			anim.flip_h = false
			anim.play("swim")
	
	if dir == "up":
		anim.flip_v = false
		anim.flip_h = false
		if movement == 1:
			anim.play("swim")
		elif movement == 0: 
			#anim.flip_v = false
			anim.play("swim")
	
	if dir == "down":
		anim.flip_v = false
		anim.flip_h = false
		if movement == 1:
			anim.play("swim")
		elif movement == 0: 
			#anim.flip_v = false
			anim.play("swim")

func _on_enemies_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	Globals.vida -=1
	if Globals.vida == 1:
		get_tree().change_scene_to_packed(Dead)


func _on_foods_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	Globals.vida +=1
