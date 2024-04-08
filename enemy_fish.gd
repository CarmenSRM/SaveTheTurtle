extends Area2D

#@export var Dead = preload("res://Dead_2.tscn") as PackedScene

func _ready():
	$AnimatedSprite2D.play("swiming")
	$AnimatedSprite2D2.play("swiming")
	$AnimatedSprite2D3.play("swiming")
	$AnimatedSprite2D4.play("swiming")
	$AnimatedSprite2D5.play("swiming")
	$AnimatedSprite2D6.play("swiming")
	$AnimatedSprite2D7.play("swiming")
	$AnimatedSprite2D8.play("swiming")
	$AnimatedSprite2D9.play("swiming")
	$AnimatedSprite2D10.play("swiming")
	$AnimatedSprite2D11.play("swiming")
	$AnimatedSprite2D12.play("swiming")

func _process(delta):
	pass
	#if Globals.vida == 0:
	#	get_tree().change_scene_to_packed(Dead)

func _on_body_entered(body):
	#Globals.vida -=1
	pass
