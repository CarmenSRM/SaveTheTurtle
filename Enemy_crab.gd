extends Area2D

@export var Dead = preload("res://Inicio.tscn") as PackedScene

func _ready():
	$AnimatedSprite2D.play("dance")

func _process(delta):
	pass

func _on_body_entered(body):
	if "BabyFred" in body.get_name():
		print("muerte desde cangrejo")
		#get_tree().change_scene_to_packed(Dead) #Cambio de escena. 
