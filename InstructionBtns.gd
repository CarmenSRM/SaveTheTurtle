extends VBoxContainer

@export var Next = PackedScene

func _ready():
	pass 

func _process(delta):
	pass

func _on_next_pressed():
	$AnimatedSprite2D.play("Fred")
	$AnimatedSprite2D2.play("Up")
	$AnimatedSprite2D3.play("Right")
	$AnimatedSprite2D4.play("Space")
	$AnimatedSprite2D5.play("Down")
	$Label2.visibility = false

func _on_start_pressed():
	get_tree().change_scene_to_packed(Next) 
