extends CanvasLayer

const Texto : Array = [
	'¡Felicidades! Has ayudado a Fred a cruzar la playa y escapar de todos esos peligros. ¡Has hecho un gran trabajo!',
	'Ahora, en este nuevo nivel, tu misión es evitar los peligros que acechan en el mar.',
	'Ayuda a Fred a decir lo que debe comer y lo que no.',
	'Evita a los depredadores marinos.', 
	'Aléjate de la basura; la contaminación en los mares es más grande de lo que piensas.',
	'En este nuevo nivel, utiliza la flecha superior para subir.',
	'La flecha inferior para sumergirse.',
	'La flecha derecha para nadar más rápido.', 
	'Es todo lo necesario para completar este nivel. ¡Suerte! Espero verte pronto.'
]

var index = 0

@export var Next = preload("res://Nivel_Dos.tscn") as PackedScene

func hablar(Texto:String) -> void:
	show()
	if index == 0:
		$Presentadora.play("Felicita ")
		$Timer.stop()
		$Button.visible = true
	elif index == 5:
		$tecla.play("Up")
	elif index == 6:
		$tecla.play('Down')
	elif index == 7:
		$tecla.play('Right')
	else:
		$tecla.play('empty')
		$Presentadora.play('Habla')
	$Label.text = Texto
	$AnimationPlayer_Button.play("Dialog")

func _ready():
	$Fred.play("swim")
	$tecla.play("empty")
	$Presentadora.play("Calla") 
	$AnimationPlayer_Cuadro.play('Aparece')
	$Timer.start()
	$Button2.hide()

func _process(delta):
	pass

func _on_timer_timeout():
	$Presentadora.play("Felicita ")
	hablar(Texto[index])
	index+=1

func _on_button_pressed():
	if index < Texto.size():
		hablar(Texto[index])
		index += 1
	else:
		$Button3.visible = false
		$Label.hide()
		$CuadroDialogo.hide()
		$Button.hide()
		$Presentadora.hide()
		$Button2.show()

func _on_button_2_pressed():
	get_tree().change_scene_to_packed(Next)

func _on_button_3_pressed():
	get_tree().change_scene_to_packed(Next)
